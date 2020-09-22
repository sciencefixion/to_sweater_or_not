class WeatherService < BaseService
  def self.get_forecast_data(lat_lng)
    response = fore_conn.get('data/2.5/onecall') do |req|
      req.params['lat'] = lat_lng[:lat]
      req.params['lon'] = lat_lng[:lng]
      req.params['exclude'] = 'minutely'
    end
    json(response)
  end

  class << self
    private

    def fore_conn
      Faraday.new('https://api.openweathermap.org') do |req|
        req.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
      end
    end
  end
end
