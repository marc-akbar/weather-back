class WeatherController < ApplicationController

  def index
  end

  def search
    @weather_data = Weather::Gather.get_current_weather_by_location(search_params[:location])

    if @weather_data == nil
      flash.notice = "Location not found"
      redirect_to root_path
    else
      assign_variables(@weather_data)
    end
  end

  private

  def search_params
    params.permit(:location)
  end

  def assign_variables(weather_data)
    @location = get_location(params[:location])
    @scene = weather_data['currently']['icon']
    @photographer = PhotoCredit.find_photographers_by_scene(@scene)
    
    raw_conditions = Weather::Cleaner.parse_attributes(weather_data['currently'])
    @current_conditions = Weather::Cleaner.add_suffixes(raw_conditions)
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
