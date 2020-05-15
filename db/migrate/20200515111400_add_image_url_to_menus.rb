class AddImageUrlToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :image_url, :text
  end
end
