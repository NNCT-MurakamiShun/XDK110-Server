class DeleteUnnecessarySensorValuesJob < ApplicationJob

  def perform(*args)
    sensor_ids = Sensor.pluck(:id)
    sensor_ids.each do |sensor_id|
      chart_setting = ChartSetting.find_by(sensor_id: sensor_id).samples
      ids = SensorValue.where(sensor_id: sensor_id)
          .last([Settings.sensor_value.necessary_samples, chart_setting ? chart_setting : 0].max)
          .pluck(:id)
      SensorValue.where(sensor_id: sensor_id)
          .where.not(id: ids)
          .delete_all
    end
  end
end
