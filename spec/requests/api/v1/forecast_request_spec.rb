require 'rails_helper'

RSpec.describe 'Forecast request' do
  it 'sends weather data for a city', :vcr do

    get '/api/v1/forecast?location=denver,co'
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data][:attributes]).to have_key(:current)
    expect(forecast[:data][:attributes]).to have_key(:hourly)
    expect(forecast[:data][:attributes]).to have_key(:timezone)
    expect(forecast[:data][:attributes]).to have_key(:daily)


  end
end
