using CsvImport

# shop_name,biko,address,homepage_address,google_map_url
shops = CSV.read("shops_engan.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "【釜石・大槌・高田・大船渡・山田】持ち帰りのできるお店MAP",
  url: "https://www.google.com/maps/d/viewer?mid=1Pfsh7GdVYWGd557f-xB7o9HnHwGNLTWK&ll=39.17477919119192%2C141.66597541796875&z=10"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  listing = Listing.find_by(title: shop["shop_name"])
  if listing
    listing.update(google_my_map: google_my_map)
  end
end
