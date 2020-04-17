Listing.seed do |s|
  s.id = 1
  s.client_id = 1
  s.category_id = 1
  s.postal_code = "0000000"
  s.prefecture_id = 1
  s.city_id = 1
  s.address = "駅前３−３−３"
  s.title = "サンプルリスティング"
  s.description = "駅前でアクセスバツグンです"
  s.main_image = Rails.root.join("db", "fixtures", "images", "listing_main_image.jpg").open
  s.published = true
  s.hours = "10:00~11:00"
  s.holidays = "月,火"
  s.tel = "090-4479-6718"
  s.website_url = "https://morioka-kiriya-saien.owst.jp/"
end
