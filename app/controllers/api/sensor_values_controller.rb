module API
  class SensorValuesController < API::ApplicationController
    before_action :set_sensor, only: [:update, :destroy]

    def create
      @sensor = SensorValue.new(value: sensor_params[:value])
      if @sensor.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    private

    def sensor_params
      params.permit(:name, :value)
    end

    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

  end
end