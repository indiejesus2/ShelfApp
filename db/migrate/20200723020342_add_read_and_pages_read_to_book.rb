class AddReadAndPagesReadToBook < ActiveRecord::Migration
  def change
    add_column :books, :read, :boolean
    add_column :books, :pages_read, :integer
  end
end
