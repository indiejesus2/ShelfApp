class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.text :password_digest
    end
  end
end
