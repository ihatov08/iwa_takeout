class CreateGoogleMyMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :google_my_maps do |t|
      t.string :name, null: false
      t.text :url, null: false

      t.timestamps
    end
  end
end
