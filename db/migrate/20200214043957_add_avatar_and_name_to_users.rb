class AddAvatarAndNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :avatar, :string
    add_index :users, :name, unique: true
  end
end
