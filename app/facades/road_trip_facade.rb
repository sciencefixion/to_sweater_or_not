class RoadTripFacade
  def self.trip_out(origin, destination)
    RoadTrip.new(
      {
        origin: origin,
        destination: destination,
        travel_time: travel_time(origin, destination),
        arrival_forecast: ForecastFacade.current_summary(destination)
      }
    )
  end

  class << self
    private

    def travel_time(origin, destination)
      MapService.get_travel_time(origin, destination)
    end

  end
end
