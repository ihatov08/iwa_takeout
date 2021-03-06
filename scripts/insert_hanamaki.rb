using CsvImport

# shop_name,biko,address,homepage_address,google_map_url
shops = CSV.read("shops_hanamaki.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "はなまきテイクアウトマップ",
  url: "https://www.google.com/maps/d/viewer?mid=1pmaSlVOMmS9g1B4SjXO0BBWRTLcJqM5t&shorturl=1&ll=39.3733631024973%2C141.11427849999995&z=13"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  Listing.find_or_create_by(title: shop["shop_name"]) do |l|
    l.category_id =  1
    l.postal_code =  shop["address"].postal_code_from_address_delete_kigo
    l.title =  shop["shop_name"]
    l.description =  shop["biko"]
    l.prefecture =  Prefecture.find_by(name: shop["address"].match_prefecture.to_s)
    l.city =  City.find_by(name: shop["address"].match_city.to_s)
    l.address =  shop["address"].extract_only_address_from_data
    l.website_url =  shop["homepage_address"]
    l.google_map_url =  shop["google_map_url"]
    l.google_my_map = google_my_map
    l.published = true
  end

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
