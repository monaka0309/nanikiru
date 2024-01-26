class ApplicationController < ActionController::Base
    before_action :require_login

    def require_login
      unless current_user
      end
    end
  
    private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
