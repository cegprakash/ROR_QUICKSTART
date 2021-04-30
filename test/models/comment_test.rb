require "test_helper"

class CommentFlowsTest < ActionDispatch::IntegrationTest
  test "should create_comment" do
    post "/api/v1/users",
      params: { "name": 'test_user' }
    assert_response :success
  
    userFrom = @response.parsed_body
    assert_equal "test_user", userFrom['name']

    post "/api/v1/users",
      params: { "name": 'test_user2' }
    assert_response :success

    userTo = @response.parsed_body
    assert_equal "test_user2", userTo['name']


    user_from_id = userFrom['id']
    user_to_id = userTo['id']

    post '/api/v1/users/%d/comments' % [user_to_id],
      params: {
        "comment": {
          "from_user_id": user_from_id,
          "comment": "test123 asf"
        }
      }

    assert_response :success
    commentsResponse = @response.parsed_body
    assert commentsResponse['comment']
    assert commentsResponse['comment']['id']
    assert_equal commentsResponse['comment']['from_user']['id'], user_from_id

  end
end
