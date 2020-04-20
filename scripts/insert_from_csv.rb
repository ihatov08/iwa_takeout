using CsvImport

# shop_name,biko,address,homepage_address,google_map_url
shops = CSV.read("shops.csv", headers: true)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  Listing.find_or_initialize_by(title: shop["shop_name"]).update!(
    category_id: 1,
    postal_code: shop["address"].postal_code_from_address_delete_kigo,
    title: shop["shop_name"],
    description: shop["biko"],
    prefecture: Prefecture.find_by(name: shop["address"].match_prefecture.to_s),
    city: City.find_by(name: shop["address"].match_city.to_s),
    address: shop["address"].extract_only_address_from_data,
    website_url: shop["homepage_address"],
    google_map_url: shop["google_map_url"]
  )

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
