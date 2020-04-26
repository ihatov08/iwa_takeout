browser = Capybara::Session.new(:selenium)

browser.visit("https://www.google.com/maps/d/viewer?mid=1h99HIj1pZL7OSj_EDI5ITovoCsRXx6av&ll=40.298504200000025%2C141.30281130000003&z=15")

more_button = browser.all(".HzV7m-pbTTYe-bN97Pc-ti6hGc-z5C9Gb")

more_button.map(&:click)

shops = browser.all(".suEOdc")

CSV.open("shops_ninohe.csv", "a", headers: %w(shop_name biko address homepage_address google_map_url)) do |csv|
  start = 2
  shops[start..-1].each.with_index(start) do |shop, i|
    next if %w(出前).include?(shop.text)
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
    data = [shop_name, biko&.gsub(/\n/, ""), address, homepage_address, google_map_url]
    csv << data
    sleep(1)
    puts i
    puts
  end
end
