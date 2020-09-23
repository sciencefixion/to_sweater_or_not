require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'exists and does not include unnecessary data' do

    origin = 'Denver, CO'
    destination = 'Pueblo, CO'

    trip = RoadTripFacade.trip_out(origin, destination)
    binding.pry


    expect(trip.travel_time).to eq('01:43:57')
    expect(trip[:data][:attributes][:origin]).to_not be_nil
    expect(trip[:data][:attributes][:destination]).to_not be_nil
  end
end
