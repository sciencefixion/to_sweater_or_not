class NearbyRoutes
  attr_reader :id,
              :name,
              :type,
              :rating,
              :location

  def initialize(climbing_routes_data)
    @name = nearby_routes_data[:name]
    @type = nearby_routes_data[:type]
    @rating = nearby_routes_data[:rating]
    @location = nearby_routes_data[:location]
  end

  def nearby_routes_data

  end
end
