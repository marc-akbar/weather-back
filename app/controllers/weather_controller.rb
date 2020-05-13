class WeatherController < ApplicationController

  def index
  end

  def search

  end

  def show
  end

  private

  def lookup_params
    params.permit(:location)
  end
end
