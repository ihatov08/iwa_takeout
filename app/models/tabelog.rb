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
