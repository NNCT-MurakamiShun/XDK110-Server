class CreateChartSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :chart_settings do |t|
      t.references :sensor, null: false, foreign_key: true
      t.integer :interval
      t.integer :samples
      t.float :threshold
      t.string :date_format, limit: 30

      t.timestamps
    end
  end
end
