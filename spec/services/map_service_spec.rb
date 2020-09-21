require 'rails_helper'

RSpec.describe 'Map Service' do
  it 'retrieves latitude and longitude for a city', :vcr do

    latLng = {
    :lat => 39.738453,
    :lng => -104.984853
    }

    response = MapService.get_latitude_and_longitude("Denver, CO")

    expect(response).to be_a(Hash)
    expect(response.count).to eq(2)
    expect(response).to eq(latLng)
  end
end
