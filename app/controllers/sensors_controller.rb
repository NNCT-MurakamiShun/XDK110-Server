class SensorsController < ApplicationController
  before_action :set_sensor, only: [:update, :destroy]

  def create
    @sensor = Sensor.new(sensor_params)
    @sensor.save
    redirect_to device_path(params[:device_id])
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
  end

  def set_sensor
    @sensor = Sensor.find(params[:id])
  end
end