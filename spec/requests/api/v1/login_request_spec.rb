require 'rails_helper'

RSpec.describe 'User login request' do
  it 'allows a user to login' do
    user_params = {
      email: 'walter@sobchak_security.com',
      password: 'AWorldOfPain'
    }

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
      password: 'MyDirtyUndiesDudeTheWhites'
    }

    post '/api/v1/users', params: user_params

    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:body]).to include("Unauthorized")
    expect(registration_response).to_not have_key(:password)
  end
  xit 'fails with status 400 when there is a missing field' do
    user_params = {
      password: 'AWorldOfPain'
    }

    post '/api/v1/users', params: user_params

    registration_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:body]).to include("Email can't be blank")
    expect(registration_response).to_not have_key(:password)
  end
end
