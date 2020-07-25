class BooksController < ApplicationController

    get '/books' do
        @books = current_user.books.uniq
        @shelf = []
        UserBook.where("user_id = ?", current_user.id).find_each do |book|
            @shelf << book
        end
        erb :"books/index"
    end

    get '/books/new' do
        erb :"books/new"
    end

    post '/books' do
        @book = Book.find_or_create_by(params[:book])
        
        if !current_user.books.include?(@book)
            current_user.books << @book
            @shelf = UserBook.last
            @shelf.set_default_status
            @shelf.save
        end
        redirect "/books"
    end

    get '/books/:id' do
        # binding.pry
        @book = Book.find_by_id(params[:id])
        erb :"books/show"
    end

    patch '/books/:id' do
        mine = UserBook.find_by(book_id: params[:id])

        # <%= if 'checked' book.read = true %>
        if mine.pages_read != params["s.pages_read"]
            mine.pages_read = params["s.pages_read"]
            mine.save
        end

        binding.pry

        if params[:book] && mine.read != params[:book][:read]
            mine.read = params[:book][:read]
            mine.save
        end
        
        redirect "/books"
    end



    delete '/books/:id' do
        @book = current_user.books.find_by_id(params[:id])
        current_user.books.delete(@book)
        redirect "/books"
    end


        
end