class User < ActiveRecord::Base
    has_secure_password
    has_many :user_books
    has_many :books, through: :user_books
    #active record validations -> uniqueness
    
    def book_shelf 
        self.books
    end
end