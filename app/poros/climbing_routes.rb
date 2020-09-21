class ClimbingRoutes
  attr_reader :id,
              :location,
              :forecast,
              :routes

  def initialize(location, forecast_data, climbing_route_data)
    @location = location
    @forecast = forecast_data[:current]
    @routes = climbing_route_data

  end
end
