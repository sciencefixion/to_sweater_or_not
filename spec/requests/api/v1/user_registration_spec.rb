require 'rails_helper'

RSpec.describe 'User Registration request' do
  it 'allows a user to create an account' do
    user_params = {
      email: 'walter@sobchak_security.com',
      password: 'AWorldOfPain',
      password_confirmation: 'AWorldOfPain'
    }

    post '/api/v1/users', params: user_params


    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:data]).to have_key(:id)
    expect(registration_response).to_not have_key(:password)
    expect(registration_response[:data][:attributes]).to have_key(:api_key)
    expect(registration_response[:data][:attributes]).to have_key(:email)
    expect(registration_response[:data][:attributes][:email]).to eq(user_params[:email])
    expect(registration_response[:data][:attributes][:api_key]).to_not be_nil
  end
  it 'fails with status 400 when passwords do not match' do
    user_params = {
      email: 'walter@sobchak_security.com',
      password: 'AWorldOfPain',
      password_confirmation: 'ICanGetYouAToeBy3pmWithNailPolish'
    }

    post '/api/v1/users', params: user_params

    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:body]).to include("Password confirmation doesn't match Password")
    expect(registration_response).to_not have_key(:password)
  end
  it 'fails with status 400 when email has already been taken' do
    user_params = {
      email: 'walter@sobchak_security.com',
      password: 'AWorldOfPain',
      password_confirmation: 'AWorldOfPain'
    }
    walter = User.create(user_params)

    post '/api/v1/users', params: user_params

    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:body]).to include("Email has already been taken")
    expect(registration_response).to_not have_key(:password)
  end
  it 'fails with status 400 when there is a missing field' do
    user_params = {
      email: 'walter@sobchak_security.com',
      password: 'AWorldOfPain'
    }

    post '/api/v1/users', params: user_params

    registration_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:body]).to include("Password confirmation can't be blank")
    expect(registration_response).to_not have_key(:password)
  end
end
