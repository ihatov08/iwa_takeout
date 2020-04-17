class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.references :category, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.references :prefecture, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :address, null: false
      t.string :title, null: false
      t.string :hours
      t.string :holidays
      t.string :tel
      t.string :website_url
      t.text :description, null: false
      t.string :main_image
      t.boolean :published, null: false, default: true

      t.timestamps
    end
  end
end
