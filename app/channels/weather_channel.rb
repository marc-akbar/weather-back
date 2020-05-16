class WeatherChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'weather_channel'
  end

  def unsubscribed
    stop_all_streams
  end
end
