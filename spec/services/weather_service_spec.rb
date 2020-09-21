require 'rails_helper'

RSpec.describe 'Weather Service' do
  xit 'retrieves weather data for a city' do

    latLng = {
    :lat => 39.738453,
    :lng => -104.984853
    }

    response = WeatherService.get_forecast(latLng[:lat], latLng[:lng])

    expect(response).to be_a(Hash)
    # expect(response.count).to eq(2)
    # expect(response).to eq()
  end
end
