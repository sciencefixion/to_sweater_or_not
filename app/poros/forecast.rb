class Forecast
  attr_reader :id,
              :timezone,
              :current,
              :hourly,
              :daily

  def initialize(forecast_data)
    @timezone = forecast_data[:timezone]
    @current = filtered_current_forecast(forecast_data)
    @hourly = filtered_hourly_forecast(forecast_data)
    @daily = filtered_daily_forecast(forecast_data)
    binding.pry
  end

  def filtered_current_forecast(forecast_data)
    forecast_data[:current].except!(:pressure, :dew_point, :clouds, :wind_speed, :wind_gust, :wind_deg)
  end

  def filtered_hourly_forecast(forecast_data)
    forecast_data[:hourly].each do |hour|
      hour.except!(:feels_like, :pressure, :humidity, :dew_point, :clouds, :visibility, :wind_speed, :wind_gust, :wind_deg, :pop, :rain, :snow)
    end
  end

  def filtered_daily_forecast(forecast_data)
    forecast_data[:daily].each do |item|
      item.except!(:sunrise, :sunset, :feels_like, :pressure, :humidity, :dew_point, :clouds, :wind_speed, :wind_deg, :pop, :uvi)
      item[:temp].except!(:day, :night, :eve, :morn)
      item[:weather][0].except!(:id, :description)
    end
  end
end
