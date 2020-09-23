class MapService < BaseService
  def self.get_latitude_and_longitude(location)
    response = map_conn.get('geocoding/v1/address') do |req|
      req.params['location'] = location
      req.params['thumbMaps'] = false
    end
    json(response)[:results].first[:locations].first[:latLng]
  end

  def self.get_travel_time(origin, destination)
    response = map_conn.get('/directions/v2/route') do |req|
      req.params['from'] = origin
      req.params['to'] = destination
      req.params['thumbMaps'] = false
    end
    json(response)[:route][:formattedTime]
  end

  class << self
    private

    def map_conn
      Faraday.new('http://www.mapquestapi.com') do |req|
        req.params['key'] = ENV['MAPQUEST_CONSUMER_KEY']
      end
    end
  end
end
