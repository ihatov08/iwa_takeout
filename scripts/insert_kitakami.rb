using CsvImport

# title description postal_code address tel website twitter instagram facebook
shops = CSV.read("shops_kitakami.csv", headers: true)

shops.select{ |shop| shop["address"]}.each.with_index do |shop, i|
  puts "start #{i}"
  twitter_id = File.basename(shop["twitter"]) rescue nil
  instagram_id = File.basename(shop["instagram"]) rescue nil
  facebook_id = File.basename(shop["facebook"]) rescue nil
  Listing.find_or_initialize_by(title: shop["title"]).update!(
    category_id: 1,
    postal_code: shop["postal_code"].postal_code_from_address_delete_kigo,
    title: shop["title"],
    description: shop["description"]&.split("|")&.join("\n"),
    prefecture: Prefecture.find_by(name: shop["address"].match_prefecture.to_s),
    city: City.find_by(name: shop["address"].match_city.to_s),
    tel: shop["tel"],
    address: shop["address"].extract_only_address_from_data,
    website_url: shop["website"],
    twitter_id: twitter_id,
    instagram_id: instagram_id,
    facebook_id: facebook_id
  )

rescue => e
  p e.record
  p e.record.errors.full_messages
  p shop
end
