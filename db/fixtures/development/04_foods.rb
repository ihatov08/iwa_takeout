Food.seed do |s|
  s.id = 1
  s.listing_id = 1
  s.name = "鳥から"
  s.price = 1000
  s.main_image = Rails.root.join("db", "fixtures", "images", "listing_main_image.jpg").open
end

Food.seed do |s|
  s.id = 2
  s.listing_id = 1
  s.name = "たこわさ"
  s.price = 900
  s.main_image = Rails.root.join("db", "fixtures", "images", "listing_main_image.jpg").open
end
