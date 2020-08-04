class Book < ActiveRecord::Base
    has_many :user_books
    has_many :users, through: :user_books
    validates :title, presence: true
    validates :author, presence: true
    # validates_associated :user_books
    # validates_associated :users
    # before_save :set_default_status



end