# frozen_string_literal: true

# ユーザー登録についてもコントローラー
class UsersController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user) # ユーザーを自動的にログイン状態にする
      redirect_to root_path, notice: I18n.t('users.create.success')
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
