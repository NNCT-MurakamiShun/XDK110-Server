class SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :edit, :update, :destroy]

  def create
    @sensor = Sensor.new(sensor_params)
    if @sensor.save
      redirect_to :show
    else
      render :new
    end
  end

  def update
    @sensor.update(sensor_params)
      redirect_to :show
    else
      render :edit
    end
  end

  def destroy
    @sensor.destroy
  end

  private

  def sensor_params
    params.require(:sensor).permit(:name)
  end

  def set_sensor
    @sensor = Sensor.find(params[:id])
  end

end