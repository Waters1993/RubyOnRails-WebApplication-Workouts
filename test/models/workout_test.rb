require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  test "should not save workout without trainer" do  
    w = Workout.create(
      trainer: nil,
      warmup: "Test",
      body: "Test",
      finish: "Test"
    )
    assert w.errors[:trainer].any?
    refute w.valid?
  end

  test "should not save workout without warmup" do
    w = Workout.create(
      trainer: "Test",
      warmup: nil,
      body: "Test",
      finish: "Test"
    )
    
    assert w.errors[:warmup].any?
    refute w.valid?
  end

  test "should not save workout without body" do
    w = Workout.create(
      trainer: "Test",
      warmup: "Test",
      body: nil,
      finish: "Test"
    )
    assert w.errors[:body].any?
    refute w.valid?
  end

  test "should not save workout without finish" do
    w = Workout.create(
      trainer: "Test",
      warmup: "Test",
      body: "Test",
      finish: nil
    )
    assert w.errors[:finish].any?
    refute w.valid?
  end

  test "workout is valid with required attributes" do
    w = users(:james).workouts.create(
      trainer: "Test",
      warmup: "Test",
      body: "Test",
      finish: "Test"
    )
    assert w.valid?
  end
end

