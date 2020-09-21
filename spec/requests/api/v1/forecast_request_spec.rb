require 'rails_helper'

RSpec.describe 'Forecast request' do
  it 'sends weather data for a city' do

    get '/api/v1/forecast?location=denver,co'

    response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response).to have_key(:id)
    expect(response).to have_key(:current)
    expect(response).to have_key(:hourly)
    expect(response).to have_key(:timezone)
    expect(response).to have_key(:daily)

    
  end
end
