class Api::V1::ForecastController < ApplicationController
  def index
    lat_lng = MapService.get_latitude_and_longitude(params[:location])
    forecast_data = WeatherService.get_forecast(lat_lng[:lat], lat_lng[:lng])
    render json: ForecastSerializer.new(Forecast.new(forecast_data))
  end
end
