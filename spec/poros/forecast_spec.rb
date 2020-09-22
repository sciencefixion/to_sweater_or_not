require 'rails_helper'

RSpec.describe Forecast do
  VCR.use_cassette('retrieves_weather_data_for_a_city') do
    it 'exists and has readable attributes' do

      lat_lng = {
      :lat => 39.738453,
      :lng => -104.984853
      }

      forecast_data = WeatherService.get_forecast(lat_lng[:lat], lat_lng[:lng])

      forecast = Forecast.new(forecast_data)

      expect(forecast).to be_an_instance_of(Forecast)
      expect(forecast.timezone).to_not be_nil
      expect(forecast.current).to_not be_nil
      expect(forecast.hourly).to_not be_nil
      expect(forecast.daily).to_not be_nil
      expect(forecast.current).to_not have_key(:pressure)
      expect(forecast.current).to_not have_key(:dew_point)
      expect(forecast.current).to_not have_key(:clouds)
      expect(forecast.current).to_not have_key(:wind_speed)
      expect(forecast.current).to_not have_key(:wind_gust)
      expect(forecast.current).to_not have_key(:wind_deg)
      expect(forecast.hourly.first).to_not have_key(:pressure)
      expect(forecast.hourly.first).to_not have_key(:dew_point)
      expect(forecast.hourly.first).to_not have_key(:clouds)
      expect(forecast.hourly.first).to_not have_key(:wind_speed)
      expect(forecast.hourly.first).to_not have_key(:wind_gust)
      expect(forecast.hourly.first).to_not have_key(:pop)
      expect(forecast.daily.first).to_not have_key(:pressure)
      expect(forecast.daily.first[:temp]).to_not have_key(:eve)
      expect(forecast.daily.first[:weather][0]).to_not have_key(:description)
    end
  end
end
