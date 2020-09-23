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
    login_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')

    expect(login_response[:data]).to have_key(:id)
    expect(login_response[:data][:attributes]).to_not have_key(:password)
    expect(login_response[:data][:attributes]).to have_key(:api_key)
    expect(login_response[:data][:attributes]).to have_key(:email)
    expect(login_response[:data][:attributes][:email]).to eq(user_params[:email])
    expect(login_response[:data][:attributes][:api_key]).to_not be_nil
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

    failed_login = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    expect(response.content_type).to eq('application/json')
    expect(failed_login[:body]).to include("Bad credentials")
    expect(failed_login).to_not have_key(:password)
  end
end
