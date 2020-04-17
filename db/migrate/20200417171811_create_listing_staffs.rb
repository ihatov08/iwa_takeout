class CreateListingStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_staffs do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :client_staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
