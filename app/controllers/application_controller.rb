class ApplicationController < ActionController::Base

  def routing_error
    redirect_to devices_path
  end
end
