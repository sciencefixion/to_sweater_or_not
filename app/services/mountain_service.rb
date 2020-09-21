class MountainService < BaseService
  def self.get_routes(lat, lon)
    response = mtn_conn.get('/data/get-routes-for-lat-lon') do |req|
      req.params['lat'] = lat
      req.params['lon'] = lon
    end
    json(response)
  end

  class << self
    private

    def mtn_conn
      Faraday.new('https://www.mountainproject.com') do |req|
        req.params['key'] = ENV['MOUNTAIN_DATA_PROJECT_API_KEY']
      end
    end
  end
end
