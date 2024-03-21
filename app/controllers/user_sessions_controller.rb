# frozen_string_literal: true

# ログインについてのコントローラー
class UserSessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new; end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_back_or_to(root_path, notice: I18n.t('user_sessions.login.success'))
    else
      flash.now[:alert] = I18n.t('user_sessions.login.failure')
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: I18n.t('user_sessions.logout.success')
  end
end
