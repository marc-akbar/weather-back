class ParseWeather

  # DarkSky icon respsonse
  SCENES = [
    'clear-day',
    'clear-night',
    'rain',
    'snow',
    'sleet',
    'wind',
    'fog',
    'cloudy',
    'partly-cloudy-day',
    'partly-cloudy-night'
  ]

  ATTRIBUTES =
    [
      "time",
      "summary",
      "icon",
      "precipProbability",
      "temperature",
      "dewPoint",
      "humidity",
      "pressure",
      "windSpeed",
      "uvIndex"
    ]

  def self.parse_attributes(hash)
    hash.slice(*ATTRIBUTES)
  end

end
