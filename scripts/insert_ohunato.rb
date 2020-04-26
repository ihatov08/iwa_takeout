using CsvImport

# shop_name,biko,address,homepage_address,google_map_url
shops = CSV.read("shops_ohunato.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "おおふなとの飲食店☆お持ち帰り可能店舗マップ",
  url: "https://www.google.com/maps/d/viewer?mid=1JMSDh79INPZGaxfRVie0M1YMM4bth3-E&ll=39.062443331909535%2C141.72051310000006&z=17"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  Listing.find_or_create_by(title: shop["shop_name"]) do |s|
    s.category_id = 1
    s.postal_code = shop["address"].postal_code_from_address_delete_kigo
    s.title = shop["shop_name"]
    s.description = shop["biko"]
    s.prefecture = Prefecture.find_by(name: shop["address"].match_prefecture.to_s)
    s.city = City.find_by(name: shop["address"].match_city.to_s)
    s.address = shop["address"].extract_only_address_from_data
    s.website_url = shop["homepage_address"]
    s.google_map_url = shop["google_map_url"]
    s.google_my_map = google_my_map
    s.published = true
  end

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
