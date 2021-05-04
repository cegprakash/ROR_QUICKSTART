require 'rails_helper'

RSpec.describe 'CommentRoutes', type: :request do
  scenario 'Comments creation' do
    post "/api/v1/users", params: {:name => 'test user 888'}
    response.code.should eq "200"        
    response_body = JSON.parse(response.body)
    from_user_id = response_body['id'].to_i;

    post "/api/v1/users", params: {:name => 'test user 999'}

    expect(response.code).to eq('200')
    #response.code.should eq "200"
    response_body = JSON.parse(response.body)
    to_user_id = response_body['id'].to_i;


    post "/api/v1/users/%d/comments" % [to_user_id], params: { user: {comment: { from_user_id: from_user_id, comment: 'test comment'}}};
    expect(response.code).to eq('200')

    response_body = JSON.parse(response.body)

    get "/api/v1/users/%d" % [to_user_id.to_i]
    expect(response.code).to eq('200')

    response_body = JSON.parse(response.body)
    puts(response_body)
    expect(response_body['user']['id']).to eq(to_user_id)
    expect(response_body['user']['comments_received'][0]['comment']).to eq('test comment')
    expect(response_body['user']['comments_received'][0]['from_user']['id']).to eq(from_user_id)
  end
end
