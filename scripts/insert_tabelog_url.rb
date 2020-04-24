tabelog = CSV.read("tabelog.csv")

tabelog.each do |title, tabelog_url|
  next unless tabelog_url.include?("tabelog")
  listing = Listing.find_by(title: title)

  if listing
    listing.update(tabelog_url: tabelog_url)
  end
end
