class ApplicationController < ActionController::Base
    before_action :require_login

    def require_login
      unless current_user
      end
    end
  
    private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]


    private

    def not_authenticated
        redirect_to login_path, alert: "ログインしてください"
    end
end
