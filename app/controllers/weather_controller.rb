class WeatherController < ApplicationController

  def index
  end

  def search
    @location = params[:location]
    @weather_data = Weather::DataGather.get_current_weather_by_location(search_params[:location])

    if @weather_data != nil
      scene = @weather_data['currently']['icon']
      @current_conditions = Weather::DataCleaner.parse_attributes(@weather_data['currently'])
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
