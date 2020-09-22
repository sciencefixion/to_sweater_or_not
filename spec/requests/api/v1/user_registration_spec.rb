require 'rails_helper'

RSpec.describe 'User Registration request' do
  it 'allows a user to create an account' do
    user_params = {
      email: 'walter@sobchak_security.com',
      password: 'AWorldOfPain',
      password_confirmation: 'AWorldOfPain'
    }

    post '/api/v1/users', params: user_params

    expect(response).to be_successful
    expect(response.status).to eq(201)

    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq('application/json')
    expect(registration_response[:data]).to have_key(:id)

    expect(registration_response[:data][:attributes]).to have_key(:api_key)
    expect(registration_response[:data][:attributes]).to have_key(:email)
    expect(registration_response[:data][:attributes][:email]).to eq(user_params[:email])
    expect(registration_response[:data][:attributes][:api_key]).to_not be_nil
  end
end
