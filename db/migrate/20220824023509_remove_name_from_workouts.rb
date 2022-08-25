class RemoveNameFromWorkouts < ActiveRecord::Migration[7.0]
  def change
    remove_column :workouts, :name, :string
    remove_column :workouts, :description, :string
  end
end
