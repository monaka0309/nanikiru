# frozen_string_literal: true

# アプリケーションの基本コントローラー
class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    unless current_user
    end
  end

  protect_from_forgery with: :exception

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]


  def not_authenticated
    redirect_to login_path, alert: I18n.t('alerts.login_required')
  end
end
