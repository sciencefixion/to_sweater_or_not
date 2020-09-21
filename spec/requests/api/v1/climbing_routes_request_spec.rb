require 'rails_helper'

RSpec.describe 'Climbing Routes request' do
  it 'sends current forecast and nearby climbing_routes for a location and distance to each trail', :vcr do

    get '/api/v1/climbing_routes?location=denver,co'
    nearby_routes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    expect(nearby_routes[]).to have_key(:id)
    # expect(forecast[:data][:attributes]).to have_key(:current)
    # expect(forecast[:data][:attributes]).to have_key(:hourly)
    # expect(forecast[:data][:attributes]).to have_key(:timezone)
    # expect(forecast[:data][:attributes]).to have_key(:daily)


  end
end
