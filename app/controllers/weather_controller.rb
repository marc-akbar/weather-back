class WeatherController < ApplicationController

  def index
  end

  def search
    @location = params[:location]
    @result = WeatherGetter.get_current_weather_by_location(search_params[:location])

    if @result != nil
      scene = @result['currently']['icon']
      @current_conditions = ParseWeather.parse_attributes(@result['currently'])
    else
      flash.notice = "Location not found"
      redirect_to root_path
    end

  end

  private

  def search_params
    params.permit(:location)
  end
end
