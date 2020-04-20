class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.references :listing, null: false, foreign_key: true
      t.string :image, null: false

      t.timestamps
    end
  end
end
