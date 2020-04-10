class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.string :tel
      t.text :description
      t.string :postal_code
      t.string :address
      t.string :open_at
      t.string :close_at

      t.timestamps
    end
  end
end
