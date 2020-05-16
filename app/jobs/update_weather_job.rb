class UpdateWeatherJob < ApplicationJob
  queue_as :default

  def perform(location)
    weather_data = Weather::Gather.get_current_weather_by_location(location)

    ActionCable.server.broadcast("weather_channel", weather_data: weather_data)
  end

  after_perform do |job|
    self.class.set(wait: 600.seconds).perform_later(job.arguments.first)
  end
end
