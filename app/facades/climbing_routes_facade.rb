class ClimbingRoutesFacade

  def self.climbing_routes(location)
    lat_lng = MapService.get_latitude_and_longitude(location)

    forecast = ForecastFacade.current_summary(lat_lng)
    binding.pry

    # "forecast": {
    #     "summary": "Raining cats and dogs",
    #     "temperature": "65"
    climbing_route_data = ClimbingService.get_routes(lat_lng[:lat], lat_lng[:lng])

    nearby_routes = climbing_route_data[:routes]

    filtered_routes = nearby_routes.each do |route|
      route.except!(:stars, :starVotes, :pitches)
      lon = route[:longitude]
      lat = route[:latitude]
      route[:distance_to_route] = MapService.get_distance(location, "#{lat},#{lon}")
    end

    ClimbingRoutes.new(location, forecast, filtered_routes)
  end
end
