class Forecast
  attr_reader :id,
              :timezone,
              :current,
              :hourly,
              :daily

  def initialize(forecast_data)
    @timezone = forecast_data[:timezone]
    @current = forecast_data[:current]
    @hourly = forecast_data[:hourly]
    @daily = forecast_data[:daily]
  end
end
