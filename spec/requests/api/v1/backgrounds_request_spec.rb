require 'rails_helper'

RSpec.describe 'Backgrounds request' do
  it 'sends a background image link for a city', :vcr do

    get '/api/v1/backgrounds?location=denver,co'
    background_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    expect(background_json[:data]).to have_key(:id)
    expect(background_json[:data][:attributes]).to have_key(:location)
    expect(background_json[:data][:attributes]).to have_key(:image_url)
    expect(background_json[:data][:attributes]).to have_key(:source)
  end
end
