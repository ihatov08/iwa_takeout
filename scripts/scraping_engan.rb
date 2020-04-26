browser = Capybara::Session.new(:selenium)

browser.visit("https://www.google.com/maps/d/viewer?mid=1Pfsh7GdVYWGd557f-xB7o9HnHwGNLTWK&ll=39.17477919119192%2C141.66597541796875&z=10")

more_button = browser.all(".HzV7m-pbTTYe-bN97Pc-ti6hGc-z5C9Gb")

more_button.map(&:click)

shops = browser.all(".suEOdc")

CSV.open("shops_engan.csv", "a") do |csv|
  csv << %w(shop_name biko address homepage_address google_map_url tel)
  start = 2
  finish_num = -1
  shops[start..finish_num].each.with_index(start) do |shop, i|
    next if %w(山田 大槌 釜石 大船渡 陸前高田).include?(shop.text)
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

    tel = browser.find(".fO2voc-jRmmHf-LJTIlf").text.match(/\+\d{1,4} \d{1,4}-\d{1,4}-\d{1,4}/).to_s rescue nil

    back = browser.find(".qqvbed-a4fUwd-LgbsSe-Bz112c").click
    data = [shop_name, biko&.gsub(/\n/, ""), address, homepage_address, google_map_url, tel]
    p data
    csv << data
    sleep(1)
    puts i
    puts
  end
end
