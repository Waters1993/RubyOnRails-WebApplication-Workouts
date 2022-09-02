require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "new shows login form" do
    get new_session_path
    assert_response :success
    assert_select 'form div', 2
  end

 test "perform user login" do
  post session_path,
    params: {
      email: 'testaccount@test.com',
      password: 'test4'
    }
    assert_redirected_to workouts_path
    assert_equal users(:james).id, session[:user_id]
 end

end
