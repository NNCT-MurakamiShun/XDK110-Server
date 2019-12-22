module Sensors
  class CreateService
    def initialize(params)
      @params = params
    end

    def execute
      ActiveRecord::Base.transaction do
        @sensor = Sensor.new(@params)
        @sensor.save!
        @chart_setting = ChartSetting.new(
          sensor_id: @sensor.id,
          interval: 1000,
          samples: 100,
          threshold: nil,
          date_format: 'MM/DD/YYYY hh:mm:ss'
        ).save!
      end
    end

  end
end