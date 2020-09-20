class MapService < BaseService
  def self.get_latitude_and_longitude(location)
    response = map_conn.get('geocoding/v1/address') do |req|
      req.params['key'] = ENV['MAPQUEST_CONSUMER_KEY']
      req.params['location'] = location
      req.params['thumbMaps'] = false
    end
    json(response)
  end

  private

  def self.map_conn
    conn('http://www.mapquestapi.com') do |req|
      req.params['key'] = ENV['MAPQUEST_CONSUMER_KEY']
    end
  end
end
