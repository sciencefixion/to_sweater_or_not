class Api::V1::MountainController < ApplicationController
  def index
    lat_lng = MapService.get_latitude_and_longitude(params[:location])
    forecast_data = WeatherService.get_forecast(lat_lng[:lat], lat_lng[:lng])
    forecast = Forecast.new(forecast_data).current
    # MountainService.get_routes()
    # render json: MountainSerializer.new()
  end
end
