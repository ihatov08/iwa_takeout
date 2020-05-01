using CsvImport

shops = CSV.read("hachimantai.csv", headers: true)

shops.each.with_index(1) do |shop, i|
  puts "start #{i}"
  twitter_id = File.basename(shop["twitter"]) rescue nil
  message = <<~TEXT
  テイクアウトの内容
  #{shop["テイクアウトの内容"]}
  メニュー
  #{shop["メニュー"]}
  価格帯
  #{shop["価格帯"]}
TEXT
  puts message
  Listing.find_or_create_by(title: shop["title"]) do |s|
    s.category_id = 1
    s.postal_code = shop["address"].postal_code_from_address_delete_kigo
    s.title = shop["title"]
    s.description = message
    s.prefecture = Prefecture.find_by(name: shop["address"].match_prefecture.to_s)
    s.city = City.find_by(name: shop["address"].match_city.to_s)
    s.address = shop["address"].extract_only_address_from_data
    s.website_url = shop["website_url"]
    s.twitter_id = twitter_id
    s.google_map_url = shop["google_map_url"]
    s.published = true
  end
end

shops.each do |shop|
  listing = Listing.find_by!(title: shop["title"])
  listing.update(tabelog_url: shop["tabelog_url"])
end
