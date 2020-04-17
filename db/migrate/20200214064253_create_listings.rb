class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.references :client, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.references :prefecture, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :address, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :main_image
      t.integer :price, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
