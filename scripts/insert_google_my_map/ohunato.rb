shops = CSV.read("shops_ohunato.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "おおふなとの飲食店☆お持ち帰り可能店舗マップ",
  url: "https://www.google.com/maps/d/viewer?mid=1JMSDh79INPZGaxfRVie0M1YMM4bth3-E&ll=39.062443331909535%2C141.72051310000006&z=17"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  listing = Listing.find_by(title: shop["shop_name"])
  if listing
    listing.update(google_my_map: google_my_map)
  end
end
