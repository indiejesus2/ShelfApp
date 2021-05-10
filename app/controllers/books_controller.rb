class BooksController < ApplicationController
    
    get '/books' do
        @books = current_user.books.sort_by { |book| book.title }
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
            redirect "/books/new", :messages => "Need more information"
        end

    end

    get '/books/:id' do    
        erb :"books/show"
    end

    patch '/books/:id' do
        current_user.bookmark(params[:id]).update(params[:bookmark])
        redirect "/books"        
    end

    delete '/books/:id' do
        current_user.books.delete(copy)
        redirect "/books"
    end

    private

    def copy
        current_user.books.find_by_id(params[:id])
    end
         
end