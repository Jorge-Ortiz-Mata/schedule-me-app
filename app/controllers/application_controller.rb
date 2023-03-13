class ApplicationController < ActionController::Base

  private

  def set_host_name
    if Rails.env.development?
      @hostname = 'localhost:3000'
    else
      @hostname = request.host
    end
  end
end
