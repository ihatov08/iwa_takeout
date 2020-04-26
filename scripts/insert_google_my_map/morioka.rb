shops = CSV.read("shops.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "盛岡市テイクアウトのできるお店マップ",
  url: "https://www.google.com/maps/d/viewer?mid=1POnW2Z-iq0J7TH33HXSrwndSXWuP1Cxs&ll=39.70172987564244%2C141.14710269961552&z=17"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  listing = Listing.find_by(title: shop["shop_name"])
  if listing
    listing.update(google_my_map: google_my_map)
  end
end
