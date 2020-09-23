require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'exists and does not include unnecessary data' do

    origin = 'Denver, CO'
    destination = 'Pueblo, CO'

    trip = RoadTripFacade.trip_out(origin, destination)

    expect(trip.origin).to_not be_nil
    expect(trip.destination).to_not be_nil
    expect(trip.travel_time).to eq('01:43:57')
    expect(trip.arrival_forecast).to have_key(:summary)
    expect(trip.arrival_forecast).to have_key(:temperature)

  end
end
