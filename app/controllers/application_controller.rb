# frozen_string_literal: true

# アプリケーションの基本コントローラー
class ApplicationController < ActionController::Base
  private

  def not_authenticated
    redirect_to login_path, alert: I18n.t('alerts.login_required')
  end
end
