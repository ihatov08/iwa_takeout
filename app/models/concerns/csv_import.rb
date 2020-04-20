module CsvImport
  refine String do
    def postal_code_regexp
      /^〒\d{3}-\d{4}/
    end

    def postal_code_from_address
      match(postal_code_regexp)
    end

    def postal_code_from_address_delete_kigo
      match(/^〒\d{3}-\d{4}/).to_s.delete("〒")
    end

    def prefecture_regexp
      /\p{Han}.*県/
    end

    def match_prefecture
      match(prefecture_regexp)
    end

    def city_regexp
      /(?<=県).+市/
    end

    def match_city
      match(city_regexp)
    end

    def extract_only_address_from_data
      gsub(postal_code_regexp, "").gsub(city_regexp, "").gsub(prefecture_regexp, "").gsub(/^ /, "")
    end
  end
end
