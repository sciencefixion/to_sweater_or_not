class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :arrival_forecast

  def initialize(road_trip_data)
    @origin = road_trip_data[:origin]
    @destination = road_trip_data[:destination]
    @travel_time = road_trip_data[:travel_time]
    @arrival_forecast = road_trip_data[:arrival_forecast]
  end
end
