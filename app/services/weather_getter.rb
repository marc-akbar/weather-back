class WeatherGetter

  def self.get_current_weather_by_lat_long(lat, long)
    make_request("#{lat},#{long}")
  end

  private
  API_KEY = "6153a1bf5f8787976c8b46f8120f77fb"

  def self.make_request(args)
    url = "https://api.darksky.net/forecast/#{API_KEY}/#{args}"
    response = Excon.get(url)
    JSON.parse(response.body)
  end
end
