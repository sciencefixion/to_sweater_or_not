require 'rails_helper'

RSpec.describe 'User login request' do
  it 'allows a user to login' do
    user_params = {
      email: 'walter@sobchak_security.com',
      password: 'AWorldOfPain',
      password_confirmation: 'AWorldOfPain'
    }
    walter = User.create(user_params)

    post '/api/v1/sessions', params: user_params
    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')

    expect(registration_response[:data]).to have_key(:id)
    expect(registration_response[:data][:attributes]).to_not have_key(:password)
    expect(registration_response[:data][:attributes]).to have_key(:api_key)
    expect(registration_response[:data][:attributes]).to have_key(:email)
    expect(registration_response[:data][:attributes][:email]).to eq(user_params[:email])
    expect(registration_response[:data][:attributes][:api_key]).to_not be_nil
  end
  it 'fails with status 401 for bad credentials' do
    user_params = {
      email: 'walter@sobchak_security.com',
      password: 'AWorldOfPain',
      password_confirmation: 'AWorldOfPain'
    }
    walter = User.create(user_params)

    post '/api/v1/sessions', params: {
      email: 'walter@sobchak_security.com',
      password: 'MyDirtyUndiesDudeTheWhites'
    }

    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:body]).to include("Bad credentials")
    expect(registration_response).to_not have_key(:password)
  end
end
