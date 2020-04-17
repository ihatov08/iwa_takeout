ActiveAdmin.register Food do
  permit_params :listing_id, :name, :price, :main_image

  show do
    attributes_table do
      row :listing
      row :name
      row :price
      row :main_image do |ad|
        image_tag ad.main_image.url
      end
    end
    active_admin_comments
  end
end
