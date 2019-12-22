class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
    @devices = Device.eager_load(:sensors).order(:id)
  end

  def show

  end

  def create
    @device = Device.new(device_params)
    if @device.save
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  def update
    @device.update(device_params)
    redirect_to @device
  end

  def destroy
    @device.destroy

    redirect_to action: :index
  end

  private

  def device_params
    params.require(:device).permit(:name)
  end

  def set_device
    @device = Device.eager_load(:sensors).find(params[:id])
  end

end