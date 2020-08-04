class BooksController < ApplicationController
    @@shelf = []

    get '/books' do
        @books = current_user.books
        erb :"books/index"
    end

    get '/books/new' do
        erb :"books/new"
    end

    post '/books' do
        flash[:info] = "Please enter a title and author."
        @book = Book.find_or_create_by(params[:book])
        if @book.valid?
            current_user.user_books.create(book_id: @book.id, pages_read: 0, read: false)
            redirect "/books"           
        else
            flash[:info]
            redirect "/books/new"
        end

    end

    get '/books/:id' do
        @book = Book.find_by_id(params[:id])       
        erb :"books/show"
    end

    patch '/books/:id' do
        @bookmark = current_user.user_books.find_by(book_id: params[:id])
        @bookmark.update(params[:bookmark])
        @book = Book.find_by_id(params[:id])
        flash[:update] = "#{@book.title} has been updated!"
        flash[:update]
        redirect "/books"        
    end

    delete '/books/:id' do
        @book = current_user.books.find_by_id(params[:id])
        current_user.books.delete(@book)
        redirect "/books"
    end
         
end