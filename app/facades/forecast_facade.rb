class ForecastFacade

  def self.current_summary(lat_lng)
    forecast_data = WeatherService.get_forecast(lat_lng[:lat], lat_lng[:lng])

    x = Forecast.new(forecast_data)
    binding.pry
  end
end
