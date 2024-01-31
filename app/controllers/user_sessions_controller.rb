class UserSessionsController < ApplicationController
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
        logout
        redirect_to root_url, notice: 'ログアウトしました'
    end
end
