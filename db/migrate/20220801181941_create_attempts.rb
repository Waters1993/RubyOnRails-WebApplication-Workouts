class CreateAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :attempts do |t|
      t.string :name
      t.integer :minutes
      t.integer :seconds
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
