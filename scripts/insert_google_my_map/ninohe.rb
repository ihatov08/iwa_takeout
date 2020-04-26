shops = CSV.read("shops_ninohe.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "二戸市テイクアウトマップ",
  url: "https://www.google.com/maps/d/viewer?mid=1h99HIj1pZL7OSj_EDI5ITovoCsRXx6av&ll=40.289131919948076%2C141.30288419954945&z=15"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  listing = Listing.find_by(title: shop["shop_name"])
  if listing
    listing.update(google_my_map: google_my_map)
  end
end
