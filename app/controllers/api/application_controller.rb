module Api
  class ApplicationController < ActionController::API
    rescue_from Exception, with: :handle_500

    def handle_500
      head :internal_server_error
    end
  end
end