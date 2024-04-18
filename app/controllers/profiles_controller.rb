# frozen_string_literal: true

# プロフィール用のコントローラー
class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.includes(:user).page(params[:page]).per(10).order(created_at: :desc)
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path(@profile)
    else
      flash.now[:danger] = 'ユーザーを更新できませんでした'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name, :image)
  end
end

