require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test "should not save workout without name" do
    workout = Workout.new
    assert_not workout.save

  end
end
