# frozen_string_literal: true

# アプリケーションの基本コントローラー
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private

  def not_authenticated
    redirect_to login_path, alert: I18n.t('alerts.login_required')
  end
end
