class AddStatusToWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :status, :string
  end
end
