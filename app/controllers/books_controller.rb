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
      #add params validations
        if params[:book][:title] != "" && params[:book][:author] != ""
            @book = Book.find_or_create_by(params[:book])
            current_user.user_books.create(book_id: @book.id, pages_read: 0, read: false)
            redirect "/books"           
        else
            redirect '/failure'
        end


    end

    get '/books/:id' do
        @book = Book.find_by_id(params[:id])
        erb :"books/show"
    end

    patch '/books/:id' do
        @book = current_user.user_books.find_by(book_id: params[:id])
        @book.update(params[:bookmark])
        redirect "/books"        
    end

    delete '/books/:id' do
        #deletefrom  user_books?
        
        @book = current_user.books.find_by_id(params[:id])
        current_user.books.delete(@book)
        redirect "/books"
    end
         
end