using CsvImport

# shop_name,biko,address,homepage_address,google_map_url,tel
shops = CSV.read("shops_engan.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "【釜石・大槌・高田・大船渡・山田】持ち帰りのできるお店MAP",
  url: "https://www.google.com/maps/d/viewer?mid=1Pfsh7GdVYWGd557f-xB7o9HnHwGNLTWK&ll=39.17477919119192%2C141.66597541796875&z=10"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  Listing.find_or_create_by(title: shop["shop_name"]) do |l|
    l.category_id = 1
    l.postal_code = shop["address"].postal_code_from_address_delete_kigo
    l.title = shop["shop_name"]
    l.description = shop["biko"]
    l.prefecture = Prefecture.find_by(name: shop["address"].match_prefecture.to_s)
    l.city = City.find_by(name: shop["address"].match_city.to_s)
    l.address = shop["address"].extract_only_address_from_data
    l.website_url = shop["homepage_address"]
    l.google_map_url = shop["google_map_url"]
    l.tel = shop["tel"]
    l.google_my_map = google_my_map
    l.published = true
  end

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
