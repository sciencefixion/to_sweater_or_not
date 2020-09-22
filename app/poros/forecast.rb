class Forecast
  attr_reader :id,
              :timezone,
              :current,
              :hourly,
              :daily

  def initialize(forecast_data)
    @timezone = forecast_data[:timezone]
    @current = forecast_data[:current_forecast]
    @hourly = forecast_data[:hourly_forecast]
    @daily = forecast_data[:daily_forecast]
  end
end
