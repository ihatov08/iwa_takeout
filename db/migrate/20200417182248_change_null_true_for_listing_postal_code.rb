class ChangeNullTrueForListingPostalCode < ActiveRecord::Migration[6.0]
  def up
    change_column_null :listings, :postal_code, true
  end

  def down
    change_column_null :listings, :postal_code, false
  end
end
