class WeatherController < ApplicationController

  def index
  end

  def search
    result = WeatherGetter.get_current_weather_by_location(search_params[:location])
    # Change to show path
    redirect_to index_path
  end

  def show
  end

  private

  def search_params
    params.permit(:location)
  end
end
