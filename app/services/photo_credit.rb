class PhotoCredit

  PHOTOGRAPHERS = {
    "wind"                => ["Allen Lee",            "https://unsplash.com/@aervea"],
    "rain"                => ["Anton Scherbakov",     "https://unsplash.com/@scherbakovx"],
    "fog"                 => ["Daniel Gregoire",      "https://unsplash.com/@yeeeeeeha"],
    "snow"                => ["Jaanus Jagomägi",      "https://unsplash.com/@jaanus"],
    "clear-night"         => ["Manouchehr Hejazi",    "https://unsplash.com/@patrol"],
    "clear-day"           => ["Mathew Schwartz",      "https://unsplash.com/@cadop"],
    "partly-cloudy-day"   => ["Raphael Andres",       "https://unsplash.com/@raphaeldas"],
    "partly-cloudy-night" => ["Raphael Andres",       "https://unsplash.com/@raphaeldas"],
    "home-background"     => ["Sara The Freak",       "https://unsplash.com/@sara_the_freek"],
    "cloudy"              => ["Toimetaja Tõlkebüroo", "https://unsplash.com/@toimetaja"]
  }

  def self.find_photographers_by_scene(scene)
    PHOTOGRAPHERS[scene]
  end

end
