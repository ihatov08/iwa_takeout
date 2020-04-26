class AddReferenceGoogleMyMapToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :google_my_map, foreign_key: true
  end
end
