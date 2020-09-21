class ClimbingRoutes
  attr_reader :id,
              :location,
              :forecast,
              :routes

  def initialize(location, climbing_route_data, forecast_data)
    @location = location
    @forecast = forecast_data[:current]
    @routes = climbing_route_data[:routes]
    # @location = climbing_route_data[:location]
    # @distance_to_route = climbing_route_data[:distance_to_route]
  end
end
