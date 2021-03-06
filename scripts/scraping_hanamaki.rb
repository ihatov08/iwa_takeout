browser = Capybara::Session.new(:selenium)

browser.visit("https://www.google.com/maps/d/viewer?mid=1pmaSlVOMmS9g1B4SjXO0BBWRTLcJqM5t&shorturl=1&ll=39.36013700000003%2C141.111447&z=13")

more_button = browser.all(".HzV7m-pbTTYe-bN97Pc-ti6hGc-z5C9Gb")

more_button.map(&:click)

shops = browser.all(".suEOdc")

CSV.open("shops_hanamaki.csv", "a") do |csv|
  csv << %w(shop_name biko address homepage_address google_map_url)
  start = 2
  shops[start..-1].each.with_index(start) do |shop, i|
    shop.click
    sleep(1)
    shop_name, biko = browser.all(".qqvbed-p83tee-lTBxed").map(&:text)
    address = browser.find(".fO2voc-jRmmHf-MZArnb-Q7Zjwb").text rescue nil
    hrefs = browser.find(".fO2voc-jRmmHf-LJTIlf").all("a").map{|m| m["href"]} rescue []
    homepage_address =
    if hrefs.size == 2
      hrefs[0]
    else
      nil
    end

    google_map_url =
    if hrefs.size == 2
      hrefs[1]
    else
      hrefs[0]
    end

    back = browser.find(".qqvbed-a4fUwd-LgbsSe-Bz112c").click
    csv << [shop_name, biko&.gsub(/\n/, ""), address, homepage_address, google_map_url]
    sleep(1)
    puts i
    puts
  end
end
