# frozen_string_literal: true

# 投票機能のコントローラー
class VotesController < ApplicationController

  before_action :require_login

  def create
    # post_idが同じpost_tile_idを持ってくる
    post_tile = PostTile.find(params[:post_tile_id])
    post = post_tile.post
    post_tiles = PostTile.where(post_id: post.id)

    # current_userの投票があったら削除する
    post_tiles.each do |target|
      if destroy_vote = current_user.votes.find_by(post_tile_id: target.id)
        destroy_vote.destroy
      end
    end

    # 投票を作成
    vote = current_user.votes.build(post_tile:)
    return unless vote.save

    # 投票が成功した場合の処理
    respond_to do |format|
      format.turbo_stream do
        # 全てのpost_tilesを作り直す
        render turbo_stream: turbo_stream.replace("post_tiles_#{post.id}", partial: 'posts/post_tiles',
                                                                            locals: { post: })
      end
    end
  end

  def destroy
    post_tile = PostTile.find(params[:post_tile_id])
    return unless vote = current_user.votes.find_by(post_tile_id: post_tile.id)

    vote&.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(post_tile, partial: 'posts/post_tile',
                                                              locals: { post_tile: })
      end
    end
  end
end
