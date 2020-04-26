# title description postal_code address tel website twitter instagram facebook
shops = CSV.read("shops_kitakami.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "きたかみテイクアウトマップ",
  url: "https://www.google.com/maps/d/viewer?mid=15ovqApDjuC56fFIk_ac4ZVxj6_ma3JOE&ll=39.28575260783608%2C141.11421139947083&z=15"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  listing = Listing.find_by(title: shop["title"])
  if listing
    listing.update(google_my_map: google_my_map)
  end
end
