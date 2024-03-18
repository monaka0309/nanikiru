# プロフィール用のコントローラー
class ProfilesController < ApplicationController
    before_action :set_user,only: %i[edit update]
    before_action :require_login, only: %i[show]

    def edit
    end

    def show
        @name = current_user.name
        @posts = current_user.posts.includes(:user).page(params[:page]).per(10)
    end

    def update
        if @user.update(user_params)
            redirect_to profile_path(@profile)
        else
            flash.now[:danger] = "ユーザーを更新できませんでした"
            render :edit
        end
    end

    private
    def set_user
        @user = User.find(current_user.id)
    end

    def user_params
        params.require(:user).permit(:email,:name,:image)
    end
end
