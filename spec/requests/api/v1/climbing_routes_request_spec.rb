require 'rails_helper'

RSpec.describe 'Climbing Routes request' do
  it 'sends current forecast and nearby climbing_routes for a location and distance to each trail', :vcr do

    get '/api/v1/climbing_routes?location=denver,co'
    nearby_routes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    # binding.pry
    # expect(response).to have_key(:id)

  end
end
