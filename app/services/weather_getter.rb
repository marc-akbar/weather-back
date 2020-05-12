class WeatherGetter

  def self.get_current_weather_by_location(location)
    location = Geocoder.search(location)
    coordinates = location.first.coordinates

    make_request("#{coordinates[0]},#{coordinates[1]}")
  end

  def self.get_current_weather_by_lat_long(lat, long)
    make_request("#{lat},#{long}")
  end

  private

  def self.make_request(args)
    url = "https://api.darksky.net/forecast/#{ENV['API_KEY']}/#{args}"
    response = Excon.get(url)
    JSON.parse(response.body)
  end
end
