class ForecastFacade
  def self.get_forecast(location)
    Forecast.new(forecast_data(location))
  end

  def self.current_summary(location)
    current_forecast = Forecast.new(forecast_data(location)).current
    {
      'temperature': "#{current_forecast[:temp]}",
      'summary': "#{current_forecast[:weather][0][:description]}"
    }
  end

  class << self
    private

    def lat_lng(location)
      MapService.get_latitude_and_longitude(location)
    end

    def forecast_data(location)
      data = WeatherService.get_forecast_data(lat_lng(location))
      {
        timezone: data[:timezone],
        current_forecast: current_filtered(data),
        hourly_forecast: hourly_filtered(data),
        daily_forecast: daily_filtered(data)
      }
    end

    def current_filtered(forecast_data)
      forecast_data[:current].except!(:pressure, :dew_point, :clouds, :wind_speed, :wind_gust, :wind_deg)
    end

    def hourly_filtered(forecast_data)
      forecast_data[:hourly].each do |hour|
        hour.except!(:feels_like, :pressure,
                     :humidity, :dew_point, :clouds, :visibility, :wind_speed, :wind_gust, :wind_deg,
                     :pop, :rain, :snow)
      end
    end

    def daily_filtered(forecast_data)
      forecast_data[:daily].each do |item|
        item.except!(:sunrise, :sunset, :feels_like,
                     :pressure, :humidity, :dew_point,
                     :clouds, :wind_speed, :wind_deg, :pop, :uvi)
        item[:temp].except!(:day, :night, :eve, :morn)
        item[:weather][0].except!(:id, :description)
      end
    end
  end
end
