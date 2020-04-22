browser = Capybara::Session.new(:selenium)

browser.visit("https://www.google.com/maps/d/u/0/viewer?mid=188u91xWrzFN68HqisSxkDH4rbFxskK7b&ll=39.5679129%2C141.10829650000005&z=19")

more_button = browser.all(".HzV7m-pbTTYe-KoToPc-ornU0b")

more_button.map(&:click)

shops = browser.all(".suEOdc")

CSV.open("shops_shiwa.csv", "a") do |csv|
  csv << %w(shop_name biko address homepage_address google_map_url)
  start = 3
  shops[start..-1].each.with_index(start) do |shop, i|
    next if %w(矢巾町飲食店 すべてのアイテム).include?(shop.text)
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
    csv << [shop_name, biko&.gsub(/\n/, ""), address, homepage_address, google_map_url]
    sleep(1)
    puts i
    puts
  end
end
