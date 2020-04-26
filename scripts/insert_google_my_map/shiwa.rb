shops = CSV.read("shops_shiwa.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "しわテイクアウトマップ",
  url: "https://www.google.com/maps/d/u/0/viewer?mid=188u91xWrzFN68HqisSxkDH4rbFxskK7b&ll=39.5679129%2C141.10829650000005&z=19"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  listing = Listing.find_by(title: shop["shop_name"])
  if listing
    listing.update(google_my_map: google_my_map)
  end
end
