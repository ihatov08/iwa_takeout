class ChangeDefaultToListingPublished < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:listings, :published, false)
  end

  def down
    change_column_default(:listings, :published, true)
  end
end
