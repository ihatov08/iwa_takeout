browser = Capybara::Session.new(:selenium)

browser.visit("https://www.google.com/maps/d/viewer?mid=1POnW2Z-iq0J7TH33HXSrwndSXWuP1Cxs&ll=39.70187946223082%2C141.1521852198448&z=12")

more_button = browser.all(".HzV7m-pbTTYe-bN97Pc-ti6hGc-z5C9Gb")

more_button.map(&:click)

shops = browser.all(".suEOdc")

  CSV.open("shops.csv", "a") do |csv|
    csv << %w(shop_name biko address homepage_address google_map_url)
    start = 119
    shops[start..-1].each.with_index(start) do |shop, i|
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