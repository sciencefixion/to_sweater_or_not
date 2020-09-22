class ForecastFacade

  def self.current_summary(lat_lng)
    forecast_data = WeatherService.get_forecast(lat_lng[:lat], lat_lng[:lng])

    current_forecast = Forecast.new(forecast_data).current

    forecast_hash = {
      'summary': "#{current_forecast[:weather][0][:description]}",
      'temperature': "#{current_forecast[:temp]}",
    }
  end
end
