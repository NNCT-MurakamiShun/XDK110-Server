class SensorsController < ApplicationController
  before_action :set_sensor, only: [:update, :destroy]

  def create
    Sensors::CreateService.new(sensor_params).execute
    redirect_to devices_path
  end

  def update
    @sensor.update(sensor_params)
    device_path(params[:device_id])
  end

  def destroy
    @sensor.destroy
    device_path(params[:device_id])
  end

  private

  def sensor_params
    params.require(:sensor).permit(:name)
        .merge(params.permit(:device_id))
  end

  def set_sensor
    @sensor = Sensor.find(params[:id])
  end
end