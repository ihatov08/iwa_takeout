class ChangeNullTrueForListingDescription < ActiveRecord::Migration[6.0]
  def up
    change_column_null :listings, :description, true
  end

  def down
    change_column_null :listings, :description, false
  end
end
