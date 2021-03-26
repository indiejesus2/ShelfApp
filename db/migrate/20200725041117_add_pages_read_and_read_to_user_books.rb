class AddPagesReadAndReadToUserBooks < ActiveRecord::Migration[4.2]
  def change
    add_column :user_books, :pages_read, :integer
    add_column :user_books, :read, :boolean
  end
end
