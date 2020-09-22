class ClimbingRoutes
  attr_reader :id,
              :location,
              :forecast,
              :routes

  def initialize(location, forecast, climbing_route_data)
    @location = location
    @forecast = forecast
    @routes = climbing_route_data
  end
end
