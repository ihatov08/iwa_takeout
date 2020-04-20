session = Capybara::Session.new(:selenium)

session.visit("https://www.google.com/maps/d/viewer?mid=15ovqApDjuC56fFIk_ac4ZVxj6_ma3JOE&ll=39.30582415035029%2C141.06173939104792&z=12")

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

CSV.open("shops_kitakami.csv", "a") do |csv|
  csv << %w(title description postal_code address tel website twitter instagram facebook)
  start = 2
  shops[start..-1].each.with_index(start) do |shop, i|
    shop.click
    sleep(1)
    title = find_by_text(text: "名前", browser: session)
    description = find_by_text(text: "説明", browser: session)
    postal_code = find_by_text(text: "郵便番号", browser: session)
    address = find_by_text(text: "住所", browser: session)
    tel = find_by_text(text: "TEL", browser: session)
    website = find_by_text(text: "Webサイト", browser: session)
    twitter = find_by_text(text: "Twitter", browser: session)
    instagram = find_by_text(text: "Instagram", browser: session)
    facebook = find_by_text(text: "Facebook", browser: session)

    back = session.find(".qqvbed-a4fUwd-LgbsSe-Bz112c").click
    data = [title, description, postal_code, address, tel, website, twitter, instagram, facebook]
    puts data
    csv << [title, description, postal_code, address, tel, website, twitter, instagram, facebook]
    sleep(1)
    puts i
    puts
  end
end
