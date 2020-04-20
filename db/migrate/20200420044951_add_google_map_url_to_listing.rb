class AddGoogleMapUrlToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :google_map_url, :string
  end
end
