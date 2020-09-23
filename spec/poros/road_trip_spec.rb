require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists and has readable attributes' do

    road_trip_data = {
    :origin => 39.738453,
    :destination => -104.984853,
    :travel_time => 39.738453,
    :arrival_forecast => -104.984853
    }

    trip = RoadTrip.new(road_trip_data)

    expect(trip).to be_an_instance_of(RoadTrip)
    expect(trip.origin).to_not be_nil
    expect(trip.destination).to_not be_nil
    expect(trip.travel_time).to_not be_nil
    expect(trip.arrival_forecast).to_not be_nil
  end
end
