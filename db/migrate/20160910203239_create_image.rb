class CreateImage < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url
    end
  end
end
