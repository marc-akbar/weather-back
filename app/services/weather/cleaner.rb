module Weather
  class Cleaner

    ATTRIBUTES = {
      "precipProbability" => "%",
      "temperature" => "°",
      "dewPoint" => "°",
      "humidity" => "%",
      "pressure" => "hPa/mbar",
      "windSpeed" => "mph",
      "uvIndex" => ""
    }

    def self.parse_attributes(hash)
      hash.slice(*ATTRIBUTES.keys)
    end

    def self.add_suffixes(hash)
      ATTRIBUTES.each do |attr|
        if attr[1] == "%"
          hash[attr[0]] = (hash[attr[0]]*100).to_i.to_s << attr[1]
        else
          hash[attr[0]] = hash[attr[0]].to_s << attr[1]
        end
      end
      return hash
    end

  end
end
