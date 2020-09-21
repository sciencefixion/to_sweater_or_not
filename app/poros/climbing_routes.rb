class ClimbingRoutes
  attr_reader :id,
              :current_forecast,
              :routes

  def initialize(climbing_route_data, forecast_data)
    @current_forecast = forecast_data[:current]
    @routes = climbing_route_data[:routes]
    # @location = climbing_route_data[:location]
    # @distance_to_route = climbing_route_data[:distance_to_route]
  end
end
