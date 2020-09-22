require 'rails_helper'

RSpec.describe 'Weather Service' do
  it 'retrieves weather data for a city', :vcr do

    lat_lng = {
    :lat => 39.738453,
    :lng => -104.984853
    }

    response = WeatherService.get_forecast_data(lat_lng)

    expect(response).to be_a(Hash)
    expect(response.size).to eq(7)
    expect(response).to have_key(:current)
    expect(response[:hourly].size).to eq(48)
    expect(response[:daily].size).to eq(8)
    expect(response[:hourly][0][:temp].nil?).to eq(false)
    expect(response[:daily].first[:temp][:max].nil?).to eq(false)
    expect(response[:daily].last[:weather][0][:description].nil?).to eq(false)
  end
end
