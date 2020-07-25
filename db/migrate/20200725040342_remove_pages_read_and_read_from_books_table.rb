class RemovePagesReadAndReadFromBooksTable < ActiveRecord::Migration
  def change
    remove_column :books, :read, :boolean
    remove_column :books, :pages_read, :integer
  end
end
