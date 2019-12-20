module Api
  class SensorValuesController < Api::ApplicationController
    before_action :set_sensor, only: [:update, :destroy]

    def index
      values = ::SensorValuesFinder.new(params[:sensor_id], search_params).values
      render json: values
    end

    def create
      value = SensorValue.new(sensor_id: params[:sensor_id], value: sensor_params[:value])
      if value.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    private

    def sensor_params
      params.permit(:value)
    end

    def search_params
      params.permit(:count)
    end
  end
end