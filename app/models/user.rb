class User < ActiveRecord::Base
    has_secure_password
    has_many :user_books
    has_many :books, through: :user_books
    validates :email, :username, uniqueness: { case_sensitive: true }
    
    def book_shelf 
        self.books
    end
end