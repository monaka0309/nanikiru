
class ApplicationController < ActionController::Base
    private
  
    def require_login
      unless current_user
        # ユーザーがログインしていない場合の処理（リダイレクトなど）
      end
    end
  
    def current_user
      # 現在のユーザーを返すロジック（セッションやクッキーを使用）
    end
end
