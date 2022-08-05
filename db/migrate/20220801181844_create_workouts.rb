class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.string :trainer
      t.string :name
      t.text :description
      t.text :warmup
      t.text :body
      t.text :finish

      t.timestamps
    end
  end
end
