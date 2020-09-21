class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    lat_lng = MapService.get_latitude_and_longitude(params[:location])
    forecast_data = WeatherService.get_forecast(lat_lng[:lat], lat_lng[:lng])
    # forecast = Forecast.new(forecast_data).current
    climbing_route_data = MountainService.get_routes(lat_lng[:lat], lat_lng[:lng])

    nearby_routes = climbing_route_data[:routes]

    filtered_routes = nearby_routes.each do |route|
      route.except!(:stars, :starVotes, :pitches, )
    end

    filtered_routes.each do |route|
      lon = route[:longitude]
      lat = route[:latitude]
      MapService.get_distance(params[:location], "#{lat},#{lon}")
    end
    binding.pry
    climbing_routes = ClimbingRoutes.new(params[:location],climbing_route_data, forecast_data)
    # render json: ClimbingRouteSerializer.new()
  end
end
