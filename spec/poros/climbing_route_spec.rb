require 'rails_helper'

RSpec.describe ClimbingRoutes do
  VCR.use_cassette('sends_current_forecast_and_nearby_climbing_routes_for_a_location_and_distance_to_each_trail') do
    it 'exists and has readable attributes' do
      location = 'Denver, Co'

      obj = ClimbingRoutesFacade.climbing_routes(location)

      expect(obj).to be_an_instance_of(ClimbingRoutes)
      expect(obj.location).to eq(location)
      expect(obj.forecast).to_not be_nil
      expect(obj.routes).to_not be_nil
    end
  end
end
