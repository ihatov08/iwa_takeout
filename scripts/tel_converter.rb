Listing.find_each do |listing|
  if listing.tel&.match(/\+\d{1,4} \d{1,4}-\d{1,4}-\d{1,4}/)
    converted_tel = listing.tel.gsub(/^\+81 /, "0")
    listing.update(tel: converted_tel)
  end
end
