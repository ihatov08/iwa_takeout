session = Capybara::Session.new(:selenium)

session.visit("https://www.google.com/maps/d/viewer?mid=1jSFrprSVLt4eALEZLJCpkO9EMCSpWJfP&ll=39.642235000000014%2C141.95382070000005&z=16")

more_button = session.all(".HzV7m-pbTTYe-bN97Pc-ti6hGc-z5C9Gb")

more_button.map(&:click)

shops = session.all(".suEOdc")

def find_by_text(text:, browser:)
  browser.within(".qqvbed-bN97Pc") do
    browser.within(".qqvbed-UmHwN") do
      text = browser.find('div', text: text, class: "qqvbed-p83tee").text
      if text.split("\n").size == 2
        text.split("\n")[1]
      else
        text.split("\n")[1..-1].join("|")
      end
    end
  end
rescue => e
  puts e
  nil
end

CSV.open("shops_miyako.csv", "a") do |csv|
  csv << %w(title description address homepage_address google_map_url tel)
  start = 2
  finish_num = -1
  shops[start..finish_num].each.with_index(start) do |shop, i|
    exclude = [
      "【宮古市】飲食店",
      "【宮古市】お弁当・出前専門・ファーストフード他",
      "【山田町】飲食店",
      "【山田町】お弁当・出前専門・ファーストフード他",
      "【岩泉町】飲食店",
      "【岩泉町】お弁当・出前専門・ファーストフード他",

    ]
    next if  exclude.include?(shop.text)
    shop.click
    sleep(1)
    title = find_by_text(text: "名前", browser: session)
    description = find_by_text(text: "備考欄（テイクアウトメニューなど）", browser: session)
    address = find_by_text(text: "住所", browser: session)
    tel = find_by_text(text: "TEL", browser: session)
    hrefs = session.find(".fO2voc-jRmmHf-LJTIlf").all("a").map{|m| m["href"]} rescue []

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

    back = session.find(".qqvbed-a4fUwd-LgbsSe-Bz112c").click
    data = [title, description&.gsub(/\n/, "|"), address, homepage_address, google_map_url, tel]
    p data
    csv << data
    sleep(1)
    puts i
    puts
  end
end
