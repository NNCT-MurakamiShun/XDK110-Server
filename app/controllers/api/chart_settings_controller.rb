module Api
  class ChartSettingsController < Api::ApplicationController
    before_action :set_chart_setting

    def update
      if @setting.update(chart_params)
        head :ok
      else
        head :bad_request
      end
    end

    private

    def set_chart_setting
      @setting = ChartSetting.find_or_create_by(sensor_id: params[:sensor_id])
    end

    def chart_params
      params.require(:chart_setting).permit(
        :interval,
        :samples,
        :threshold,
        :date_format
      )
    end
  end
end