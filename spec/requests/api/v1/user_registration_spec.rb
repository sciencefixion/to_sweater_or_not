require 'rails_helper'

RSpec.describe 'User Registration request' do
  it 'allows a user to create an account' do

    post '/api/v1/users'
    registration_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    expect(registration_response[:data]).to have_key(:id)
    expect(registration_response[:data][:attributes]).to have_key(:email)
    expect(registration_response[:data][:attributes]).to have_key(:api_key)
  end
end
