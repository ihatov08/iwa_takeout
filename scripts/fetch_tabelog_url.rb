require 'capybara/dsl'

class Tabelog
  include Capybara::DSL

  def initialize(listing)
    @listing = listing
  end

  def url
    @url ||=
    begin
      visit URI.escape("https://www.google.co.jp/search?q=#{listing.city.name} #{listing.title} 食べログ")

      url = within("#search"){all("a")}.first["href"]
    end
  end

  private

  attr_reader :listing
end

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
