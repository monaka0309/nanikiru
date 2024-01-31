class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user) # これでユーザーを自動的にログイン状態にします
      redirect_to root_path, notice: '会員登録が完了し、ログインしました。'
    else
      render :new
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :image)
  end
end
