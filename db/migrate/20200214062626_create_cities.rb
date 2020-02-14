class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.references :prefecture, null: false, foreign_key: true
      t.string :name, null: false
      t.string :name_en, null: false

      t.timestamps

      t.index %i[prefecture_id name name_en], unique: true
    end
  end
end
