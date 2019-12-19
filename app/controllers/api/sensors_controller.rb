module API
  class SensorsController < API::ApplicationController
    before_action :set_sensor, only: [:show, :edit, :update, :destroy]

    def show
      @values = @sensor.value.order(:created_at)
    end

    def create
      @sensor = Sensor.new(sensor_params)
      if @sensor.save
        render status: :created
      else
        render status: :bad_request
      end
    end

    def update
      @sensor.update(sensor_params)
        head :no_content
      else
        render status: :bad_request
      end
    end

    def destroy
      @sensor.destroy
      head :no_content
    end

    private

    def sensor_params
      params.require(:sensor).permit(:name)
    end

    def set_sensor
      @sensor = Sensor.find(params[:id])
    end

  end
end