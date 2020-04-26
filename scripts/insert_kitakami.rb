using CsvImport

# title description postal_code address tel website twitter instagram facebook
shops = CSV.read("shops_kitakami.csv", headers: true)

google_my_map = GoogleMyMap.find_or_create_by(
  name: "きたかみテイクアウトマップ",
  url: "https://www.google.com/maps/d/viewer?mid=15ovqApDjuC56fFIk_ac4ZVxj6_ma3JOE&ll=39.28575260783608%2C141.11421139947083&z=15"
)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  twitter_id = File.basename(shop["twitter"]) rescue nil
  instagram_id = File.basename(shop["instagram"]) rescue nil
  facebook_id = File.basename(shop["facebook"]) rescue nil
  Listing.find_or_create_by(title: shop["title"]) do |l|
    l.category_id = 1
    l.postal_code = shop["postal_code"].postal_code_from_address_delete_kigo
    l.title = shop["title"]
    l.description = shop["description"]&.split("|")&.join("\n")
    l.prefecture = Prefecture.find_by(name: shop["address"].match_prefecture.to_s)
    l.city = City.find_by(name: shop["address"].match_city.to_s)
    l.tel = shop["tel"]
    l.address = shop["address"].extract_only_address_from_data
    l.website_url = shop["website"]
    l.twitter_id = twitter_id
    l.instagram_id = instagram_id
    l.facebook_id = facebook_id
    l.google_my_map = google_my_map
    l.published = true
  end

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
