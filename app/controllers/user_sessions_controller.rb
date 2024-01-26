class UserSessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
    # ログイン処理
        user = login(params[:email], params[:password])
        if user
            redirect_back_or_to(root_path, notice: 'ログイン成功しました。')
        else
            flash.now[:alert] = 'ログインに失敗しました。'
            render :new
        end
    end

    def destroy
    # ログアウト処理
        logout
        redirect_to(root_path, notice: 'ログアウトしました。')
    end
end
