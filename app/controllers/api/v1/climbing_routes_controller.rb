class Api::V1::ClimbingRoutesController < ApplicationController
  def index
    lat_lng = MapService.get_latitude_and_longitude(params[:location])

    forecast_data = WeatherService.get_forecast(lat_lng[:lat], lat_lng[:lng])
    filtered_forecast = Forecast.new(forecast_data).current
    climbing_route_data = MountainService.get_routes(lat_lng[:lat], lat_lng[:lng])

    nearby_routes = climbing_route_data[:routes]

    filtered_routes = nearby_routes.each do |route|
      route.except!(:stars, :starVotes, :pitches)
      lon = route[:longitude]
      lat = route[:latitude]
      route[:distance_to_route] = MapService.get_distance(params[:location], "#{lat},#{lon}")
    end

    climbing_routes = ClimbingRoutes.new(params[:location], filtered_forecast, filtered_routes)

    render json: ClimbingRoutesSerializer.new(climbing_routes)
  end
end
