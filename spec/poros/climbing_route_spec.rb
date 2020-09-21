require 'rails_helper'

RSpec.describe ClimbingRoute do
  # VCR.use_cassette('') do
    it 'exists and has readable attributes' do

      lat_lng = {
      :lat => 39.738453,
      :lng => -104.984853
      }

      nearby_routes_data = MountainService.get_routes(lat_lng[:lat], lat_lng[:lng])

      nearby_routes = ClimbingRoute.new(forecast_data)

      expect(nearby_routes).to be_an_instance_of(ClimbingRoute)
      expect(nearby_routes.timezone).to_not be_nil
      expect(nearby_routes.current_forecast).to_not be_nil
      expect(nearby_routes.hourly).to_not be_nil
      expect(nearby_routes.daily).to_not be_nil
    end
  # end
end
