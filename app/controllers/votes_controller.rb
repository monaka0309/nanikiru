# frozen_string_literal: true

# 投票機能のコントローラー
class VotesController < ApplicationController
  before_action :require_login

  def create
    # post_idが同じpost_tile_idを持ってくる
    post_tile = PostTile.find(params[:post_tile_id])
    post = post_tile.post

    # 投票を作成
    vote = current_user.votes.build(post_tile:)
    return unless vote.save
    # 投票が成功した場合の処理
    respond_to do |format|
      format.turbo_stream do
        # 全てのpost_tilesを作り直す
        render turbo_stream: turbo_stream.replace("post_tiles_#{post.id}", partial: 'posts/shared/post_tiles', locals: { post: post }) # localsハッシュのキーと値を修正
      end
    end
  end

  def destroy
    post_tile = PostTile.find(params[:post_tile_id])
    return unless vote = current_user.votes.find_by(post_tile_id: post_tile.id)

    vote&.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("post_tile_#{post_tile.id}", partial: 'posts/shared/post_tile', locals: { post_tile: post_tile }) # localsハッシュのキーと値を修正
      end
    end
  end
end
