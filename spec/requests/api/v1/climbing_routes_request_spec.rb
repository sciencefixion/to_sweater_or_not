require 'rails_helper'

RSpec.describe 'Climbing Routes request' do
  it 'sends current forecast and nearby climbing_routes for a location and distance to each trail', :vcr do

    get '/api/v1/climbing_routes?location=denver,co'

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')

    climb_data = JSON.parse(response.body, symbolize_names: true)

    expect(climb_data).to be_a(Hash)
    expect(climb_data[:data][:attributes].size).to eq(3)
    expect(climb_data[:data][:attributes]).to have_key(:location)
    expect(climb_data[:data][:attributes]).to have_key(:forecast)
    expect(climb_data[:data][:attributes][:routes][0][:name]).to_not be_nil
    expect(climb_data[:data][:attributes][:routes][0]).to have_key(:type)
    expect(climb_data[:data][:attributes][:routes][0]).to have_key(:rating)
    expect(climb_data[:data][:attributes][:routes][0]).to have_key(:distance_to_route)
    expect(climb_data[:data][:attributes][:routes][0][:distance_to_route]).to eq(30.513)
  end
end
