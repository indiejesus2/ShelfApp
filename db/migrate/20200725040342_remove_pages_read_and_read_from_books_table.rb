class RemovePagesReadAndReadFromBooksTable < ActiveRecord::Migration[4.2]
  def change
    remove_column :books, :read, :boolean
    remove_column :books, :pages_read, :integer
  end
end
