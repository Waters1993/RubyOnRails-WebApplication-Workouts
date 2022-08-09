class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :name
      t.string :email

      t.timestamps
    end

    add_column :workouts, :user_id, :integer
    add_column :attempts, :user_id, :integer
  end
end
