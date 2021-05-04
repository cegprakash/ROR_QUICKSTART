# class UserFlowsTest < ActionDispatch::IntegrationTest
#   def test_the_truth
#     post "/api/v1/users",
#       params: { "name": 'test_user' }
#     assert_response :success
#     user = @response.parsed_body
#     assert_equal "test_user", user['name']

#     userId = user['id']

#     get '/api/v1/users/%d' % [userId]
#     assert_response :success

#     get '/api/v1/users' % [userId]
#     assert_response :success
#     usersResponse = @response.parsed_body
#     assert usersResponse['user'].length > 0
#   end
# end