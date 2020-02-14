class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :postal_code
      t.references :prefecture, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :address
      t.string :title
      t.text :description
      t.string :main_image
      t.integer :price
      t.boolean :published

      t.timestamps
    end
  end
end
