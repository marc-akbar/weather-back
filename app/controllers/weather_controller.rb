class WeatherController < ApplicationController

  def index
  end

  def search
    @weather_data = Weather::DataGather.get_current_weather_by_location(search_params[:location])

    if @weather_data == nil
      flash.notice = "Location not found"
      redirect_to root_path
    else
      @scene = @weather_data['currently']['icon']
      @photographer = PhotoCredit.find_photographers_by_scene(@scene)

      @location = get_location(params[:location])
      @current_conditions = Weather::DataCleaner.parse_attributes(@weather_data['currently'])
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
