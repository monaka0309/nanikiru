# プロフィール用のコントローラー
class ProfilesController < ApplicationController
    before_action :set_user,only: %i[edit update]
    before_action :require_login, only: %i[show]

    def edit
    end

    def show
        @name = current_user.name
        @nickname = current_user.nickname
        @posts = current_user.posts
    end

    def update
        if @user.update(user_params)
            redirect_to profile_path,success: "ユーザーを更新しました"
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
        params.require(:user).permit(:email,:name,:nickname,:image)
    end
end
