module Api
  class SensorValuesController < Api::ApplicationController
    def index
      values = ::SensorValuesFinder.new(params[:sensor_id], search_params).values
      render json: values
    end

    def create
      if SensorValue.insert_all(sensor_params)
        head :created
      else
        head :bad_request
      end
    end

    private

    def sensor_params
      ActionController::Parameters.new(JSON.parse(request.body.read))
      .permit(values: [
        :id,
        :val
      ])[:values].map{|item|
        item = {
          sensor_id: item[:id],
          value: item[:val],
          created_at: Time.zone.now,
          updated_at: Time.zone.now
        }
      }
    end

    def search_params
      params.permit(:count)
    end
  end
end