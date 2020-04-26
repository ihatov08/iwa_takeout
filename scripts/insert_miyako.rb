using CsvImport

# %wtitle description address homepage_address google_map_url tel
shops = CSV.read("shops_miyako.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "【岩泉・宮古・山田】テイクアウトのできるお店MAP",
  url: "https://www.google.com/maps/d/viewer?mid=1jSFrprSVLt4eALEZLJCpkO9EMCSpWJfP&ll=39.64159848349404%2C141.94872687460565&z=16"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  Listing.find_or_create_by(title: shop["title"]) do |l|
    l.category_id = 1
    l.postal_code = shop["address"].postal_code_from_address_delete_kigo
    l.address = shop["address"].extract_only_address_from_data
    l.title = shop["title"]
    l.description = shop["description"]&.split("|")&.join("\n")
    l.prefecture = Prefecture.find_by(name: shop["address"].match_prefecture.to_s)
    l.city = City.find_by(name: shop["address"].match_city.to_s)
    l.tel = shop["tel"]
    l.google_map_url = shop["google_map_url"]
    l.tel = shop["tel"]
    l.published = true
    l.google_my_map = google_my_map
  end

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
