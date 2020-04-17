ActiveAdmin.register Listing do
  permit_params :client_id, :category_id, :postal_code, :prefecture_id, :city_id, :address, :title, :hours, :holidays, :tel, :website_url, :description, :main_image, :published
end
