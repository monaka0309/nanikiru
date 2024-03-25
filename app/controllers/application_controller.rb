# frozen_string_literal: true

# アプリケーションの基本コントローラー
class ApplicationController < ActionController::Base
  def require_login
    return if current_user

    not_authenticated
  end

  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def not_authenticated
    redirect_to login_path, alert: I18n.t('alerts.login_required')
  end
end
