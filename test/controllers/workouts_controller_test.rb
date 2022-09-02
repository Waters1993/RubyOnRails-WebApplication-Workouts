require "test_helper"

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  test "redirects after login with return url" do
    get workouts_url
    assert_redirected_to new_session_path
    post session_path,
    params: {
      email: 'testaccount@test.com',
      password: 'test4'
    }
    assert_redirected_to workouts_url
  end

  test "should get new" do
    post session_path,
    params: {
      email: 'testaccount@test.com',
      password: 'test4'
    }
    get new_workout_url
    assert_response :success
    assert_template 'new'
    assert_not_nil assigns(:workout)
  end

end
