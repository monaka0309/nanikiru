# ユーザー検索用のコントローラー
class SearchesController < ApplicationController
    def search
        @query = params[:query]
        @users = if @query
            User.where("name LIKE ?", "%#{@query}%")
        else
            User.none
        end
    end
end
