class WeatherController < ApplicationController

  def index
  end

  def search
    result = WeatherGetter.get_current_weather_by_location(search_params[:location])
    redirect_to root_path
  end

  private

  def search_params
    params.permit(:location)
  end
end
