class AddTabelogUrlToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :tabelog_url, :string
  end
end
