class AddSupportProjectToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :support_project, :boolean, null: false, default: false
  end
end
