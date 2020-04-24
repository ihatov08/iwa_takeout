file_name = "tabelog.csv"
CSV.open(file_name, "a") do |csv|
  unless File.exists?(file_name)
    csv << %w(name tabelog_url)
  end
  Listing.find_each do |listing|
    sleep 5
    tabelog = Tabelog.new(listing)
    url = tabelog.url
    data = [listing.title, url]
    p data
    csv << data
  rescue => e
    Rails.logger.error e
  end
end
