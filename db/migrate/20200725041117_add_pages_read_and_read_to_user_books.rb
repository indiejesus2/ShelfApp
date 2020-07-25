class AddPagesReadAndReadToUserBooks < ActiveRecord::Migration
  def change
    add_column :user_books, :pages_read, :integer
    add_column :user_books, :read, :boolean
  end
end
