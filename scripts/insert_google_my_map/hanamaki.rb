using CsvImport

# shop_name,biko,address,homepage_address,google_map_url
shops = CSV.read("shops_hanamaki.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "はなまきテイクアウトマップ",
  url: "https://www.google.com/maps/d/viewer?mid=1pmaSlVOMmS9g1B4SjXO0BBWRTLcJqM5t&shorturl=1&ll=39.3733631024973%2C141.11427849999995&z=13"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  listing = Listing.find_by(title: shop["shop_name"])
  if listing
    listing.update(google_my_map: google_my_map)
  end
end
