class User < ActiveRecord::Base
    has_secure_password
    has_many :user_books
    has_many :books, through: :user_books
    validates :email, :username, uniqueness: { case_sensitive: false }
    
    def shelf 
        self.books
    end

    def bookmark(id)
        self.user_books.find_by(book_id: id)
    end

end