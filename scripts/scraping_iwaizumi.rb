browser = Capybara::Session.new(:selenium)

browser.visit("https://www.google.com/maps/d/u/0/viewer?fbclid=IwAR2w1ncut3SjV5SzxIq3_APOgrL3gNJMBiRhJrftIDmo8RrsWud8c-QMQCY&mid=1cdgfONsF5uPEqgJITEIECYMph3TYk0gb&ll=39.84692820000003%2C141.7969862&z=14")

more_button = browser.all(".HzV7m-pbTTYe-bN97Pc-ti6hGc-z5C9Gb")

more_button.map(&:click)

shops = browser.all(".suEOdc")

CSV.open("shops_iwaizumi.csv", "a") do |csv|
  csv << %w(shop_name biko address homepage_address google_map_url)
  start = 2
  shops[start..7].each.with_index(start) do |shop, i|
    next if %w(テイクアウト).include?(shop.text)
    shop.click
    sleep(1)
    shop_name, biko = browser.all(".qqvbed-p83tee-lTBxed").map(&:text)
    p "shop_name #{shop_name}"
    p "biko #{biko}"
    address = browser.find(".fO2voc-jRmmHf-MZArnb-Q7Zjwb").text rescue nil
    p "address #{address}"
    hrefs = browser.find(".fO2voc-jRmmHf-LJTIlf").all("a").map{|m| m["href"]} rescue []
    p hrefs
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
    data = [shop_name, biko&.gsub(/\n/, "|"), address, homepage_address, google_map_url]
    csv << data
    sleep(1)
    puts i
    puts
  end
end
