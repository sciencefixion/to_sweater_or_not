require 'rails_helper'

RSpec.describe 'ClimbingService' do
  it 'retrieves nearby climbing_routes', :vcr do

    latLng = {
    :lat => 39.738453,
    :lng => -104.984853
    }

    response = ClimbingService.get_routes(latLng[:lat], latLng[:lng])

    expect(response).to be_a(Hash)
    expect(response.size).to eq(2)
    expect(response[:routes][0]).to have_key(:location)
    expect(response[:routes][0]).to have_key(:rating)
    expect(response[:routes][0][:longitude]).to eq(-105.3445)
    expect(response[:routes][0][:latitude]).to eq(39.6296)
    expect(response[:routes][0].size).to eq(15)
    expect(response[:routes][0][:name]).to_not be_nil
    expect(response[:routes][0][:type]).to_not be_nil
  end
end
