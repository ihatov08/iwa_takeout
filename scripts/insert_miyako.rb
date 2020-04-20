using CsvImport

# %wtitle description address homepage_address google_map_url tel
shops = CSV.read("shops_miyako.csv", headers: true)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  Listing.find_or_initialize_by(title: shop["title"]).update!(
    category_id: 1,
    postal_code: shop["address"].postal_code_from_address_delete_kigo,
    address: shop["address"].extract_only_address_from_data,
    title: shop["title"],
    description: shop["description"]&.split("|")&.join("\n"),
    prefecture: Prefecture.find_by(name: shop["address"].match_prefecture.to_s),
    city: City.find_by(name: shop["address"].match_city.to_s),
    tel: shop["tel"],
    google_map_url: shop["google_map_url"],
    tel: shop["tel"],
    published: true
  )

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
