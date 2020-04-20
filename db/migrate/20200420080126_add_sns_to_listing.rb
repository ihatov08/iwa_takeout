class AddSnsToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :twitter_id, :string
    add_column :listings, :facebook_id, :string
    add_column :listings, :instagram_id, :string
  end
end
