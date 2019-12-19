class CreateSensorValues < ActiveRecord::Migration[6.0]
  def change
    create_table :sensor_values do |t|
      t.float :value
      t.references :sensor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
