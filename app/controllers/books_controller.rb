class BooksController < ApplicationController

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
            @book.set_default_status
            @book.save
            current_user.books << @book
        end
        redirect "/books"
    end

    get '/books/:id' do
        # binding.pry
        @book = Book.find_by_id(params[:id])
        erb :"books/show"
    end

    patch '/books/:id' do
        binding.pry
        @book = Book.find_by_id(params[:id])
        # if book.pages_read !=
        redirect "/books"
    end



    delete '/books/:id' do
        @book = current_user.books.find_by_id(params[:id])
        current_user.books.delete(@book)
        redirect "/books"
    end


        
end