class CreateListingHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_holidays do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :day_of_week, null: false, foreign_key: true

      t.timestamps
    end
  end
end
