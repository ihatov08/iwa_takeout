class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.references :listing, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.string :main_image, null: false

      t.timestamps
    end
  end
end
