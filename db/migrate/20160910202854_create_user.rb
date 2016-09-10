class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :password_confirmation
      t.integer :role
    end
  end
end
