require 'rails_helper'

RSpec.describe 'Weather Service' do
  it 'retrieves weather data for a city', :vcr do

    latLng = {
    :lat => 39.738453,
    :lng => -104.984853
    }

    response = WeatherService.get_forecast(latLng[:lat], latLng[:lng])

    expect(response).to be_a(Hash)
    expect(response.size).to eq(2)
    expect(response[:routes][0]).to have_key(:location)
    
  end
end
