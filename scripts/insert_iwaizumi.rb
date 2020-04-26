using CsvImport

# shop_name,biko,address,homepage_address,google_map_url
shops = CSV.read("shops_iwaizumi.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "いわいずみテイクアウトマップ",
  url: "https://www.google.com/maps/d/u/0/viewer?fbclid=IwAR2w1ncut3SjV5SzxIq3_APOgrL3gNJMBiRhJrftIDmo8RrsWud8c-QMQCY&mid=1cdgfONsF5uPEqgJITEIECYMph3TYk0gb&ll=39.85133436967411%2C141.82324595&z=14"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  Listing.find_or_create_by(title: shop["shop_name"]) do |s|
    s.category_id = 1
    s.postal_code = shop["address"].postal_code_from_address_delete_kigo
    s.title = shop["shop_name"]
    s.description = shop["biko"].split("|").join("\n")
    s.prefecture = Prefecture.find_by(name: shop["address"].match_prefecture.to_s)
    s.city = City.find_by(name: shop["address"].match_city.to_s)
    s.address = shop["address"].extract_only_address_from_data
    s.website_url = shop["homepage_address"]
    s.google_map_url = shop["google_map_url"]
    s.published = true
    s.google_my_map = google_my_map
  end

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
