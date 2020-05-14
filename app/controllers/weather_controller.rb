class WeatherController < ApplicationController

  def index
  end

  def search
    @location = get_location(params[:location])
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

  def get_location(input)
    arr = []

    base = Geocoder.search(input).first
    arr << base.city if base.city.present?
    arr << base.state if base.state.present?
    arr << base.country if base.country.present?

    arr.join(', ')
  end
end
