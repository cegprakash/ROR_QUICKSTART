require 'rails_helper'

RSpec.describe 'UserRoutes', type: :request do
  scenario 'User creation' do
    post "/api/v1/users", params: {:name => 'test user 888'}
    #response.code.should eq "200"
    expect(response.code).to eq('200')
    response_body = JSON.parse(response.body)

    expect(response_body['name']).to eq('test user 888')
    user_id = response_body['id'].to_i;

    get "/api/v1/users/%d" % [user_id.to_i]
    expect(response.code).to eq('200')
    response_body = JSON.parse(response.body)
    expect(response_body['user']['id']).to eq(user_id)
    expect(response_body['user']['comments_received'].length).to eq(0)
  end
end
