class SensorValuesFinder
  def initialize(sensor_id, params = {})
    @sensor_id = sensor_id
    @params = params
  end

  def values
    values = ::SensorValue.where(sensor_id: @sensor_id).order(:created_at)

    values = by_count(values)
    values
  end

  private

  def by_count(values)
    return values if @params[:count].blank?
    return values if @params[:count].to_i <= 0

    values.last(@params[:count].to_i)
  end
end