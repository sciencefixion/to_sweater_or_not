require 'rails_helper'

RSpec.describe Forecast do
  it 'exists and has readable attributes' do

    forecast_data = {
    :timezone => 39.738453,
    :current_forecast => -104.984853,
    :hourly_forecast => 39.738453,
    :daily_forecast => -104.984853
    }

    forecast = Forecast.new(forecast_data)

    expect(forecast).to be_an_instance_of(Forecast)
    expect(forecast.timezone).to_not be_nil
    expect(forecast.current).to_not be_nil
    expect(forecast.hourly).to_not be_nil
    expect(forecast.daily).to_not be_nil
  end
end
