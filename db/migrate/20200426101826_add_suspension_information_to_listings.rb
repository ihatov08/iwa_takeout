class AddSuspensionInformationToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :suspension_information, :string
  end
end
