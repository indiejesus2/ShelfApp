class Book < ActiveRecord::Base
    has_many :user_books
    has_many :users, through: :user_books
    # before_save :set_default_status

    def set_default_status
        self.read = false
        self.pages_read = 0
    end
end