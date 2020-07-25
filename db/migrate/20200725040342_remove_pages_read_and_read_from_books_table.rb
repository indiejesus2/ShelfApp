class RemovePagesReadAndReadFromBooksTable < ActiveRecord::Migration
  def change
    remove_column :books, :read
    remove_column :books, :pages_read
  end
end
