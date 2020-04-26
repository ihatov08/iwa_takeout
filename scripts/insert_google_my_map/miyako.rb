# %wtitle description address homepage_address google_map_url tel
shops = CSV.read("shops_miyako.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "【岩泉・宮古・山田】テイクアウトのできるお店MAP",
  url: "https://www.google.com/maps/d/viewer?mid=1jSFrprSVLt4eALEZLJCpkO9EMCSpWJfP&ll=39.64159848349404%2C141.94872687460565&z=16"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  listing = Listing.find_by(title: shop["title"])
  if listing
    listing.update(google_my_map: google_my_map)
  end
end
