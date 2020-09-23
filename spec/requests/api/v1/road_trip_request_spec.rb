require 'rails_helper'

RSpec.describe 'Road Trip request' do
  describe 'as a user' do
    it 'allows planning road trips' do
      user_params = {
        email: 'walter@sobchak_security.com',
        password: 'AWorldOfPain',
        password_confirmation: 'AWorldOfPain'
      }
      walter = User.create(user_params)

      body = {
        origin: 'Denver,CO',
        destination: 'Pueblo,CO',
        api_key: "#{walter.api_key}"
      }

      post '/api/v1/road_trip', params: body


      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq('application/json')
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:attributes]).to have_key(:origin)
      expect(forecast[:data][:attributes]).to have_key(:destination)
      expect(forecast[:data][:attributes]).to have_key(:travel_time)
      expect(forecast[:data][:attributes]).to have_key(:arrival_forecast)
    end
  end
  xit 'fails with status 401 with no api_key provided' do

    body = {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO'
    }

    post '/api/v1/road_trip', params: body

    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:body]).to include('Bad credentials')
    expect(registration_response).to_not have_key(:password)
  end
end
