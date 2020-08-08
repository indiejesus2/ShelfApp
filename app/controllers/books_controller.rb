class BooksController < ApplicationController
    
    get '/books' do
        erb :"books/index"
    end

    get '/books/new' do
        erb :"books/new"
    end

    post '/books' do
        book = Book.find_or_create_by(params[:book])
        if book.valid?
            current_user.user_books.create(book_id: book.id, pages_read: 0, read: false)
            redirect "/books"           
        else
            flash[:info] = "Please enter a title and author."
            redirect "/books/new"
        end

    end

    get '/books/:id' do    
        erb :"books/show"
    end

    patch '/books/:id' do
        current_user.bookmark(params[:id]).update(params[:bookmark])
        flash[:update] = "#{book.title} has been updated!"
        redirect "/books"        
    end

    delete '/books/:id' do
        current_user.books.delete(book)
        redirect "/books"
    end

    private

    def book
        current_user.books.find_by_id(params[:id])
    end
         
end