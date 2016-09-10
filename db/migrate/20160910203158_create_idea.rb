class CreateIdea < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :subject
      t.string :description
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      
      t.timestamp null: false
    end
  end
end
