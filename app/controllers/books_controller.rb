class BooksController < ApplicationController
    @@shelf = []

    get '/books' do
        @books = current_user.books.uniq
        erb :"books/index"
    end

    get '/books/new' do
        erb :"books/new"
    end

    post '/books' do
        @book = Book.find_or_create_by(params[:book])
        
        if !current_user.books.include?(@book)
            current_user.books << @book
            default = UserBook.last
            default.set_default_status
            default.save
        end
        redirect "/books"
    end

    get '/books/:id' do
        # binding.pry
        @book = Book.find_by_id(params[:id])
        erb :"books/show"
    end

    patch '/books/:id' do

        UserBook.where("user_id = ?", current_user.id).find_each do |book|
            @@shelf << book
        end

        @@shelf.each do |mine|
            @mine = mine if mine.book_id == params[:id].to_i
        end

        # <%= if 'checked' book.read = true %>
        if @mine.pages_read != params["bookmark.pages_read"]
            @mine.pages_read = params["bookmark.pages_read"]
            @mine.save
        end
        

        if params[:bookmark] && @mine.read != params[:bookmark][:read]
            @mine.read = params[:bookmark][:read]
            @mine.save
        end
        
        redirect "/books"
    end



    delete '/books/:id' do
        @book = current_user.books.find_by_id(params[:id])
        current_user.books.delete(@book)
        redirect "/books"
    end


        
end