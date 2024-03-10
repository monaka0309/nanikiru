# frozen_string_literal: true

class VotesController < ApplicationController

  before_action :require_login

  def create
    # post_idが同じpost_tile_idを持ってくる
    post_tile = PostTile.find(params[:post_tile_id])
    post_tiles = PostTile.where(post_id: post_tile.post_id)

    # current_userの投票があったら削除する
    post_tiles.each do |target|
      if destroy_vote = current_user.votes.find_by(post_tile_id: target.id)
        destroy_vote.destroy
      end
    end


    # 投票を作成。
    vote = @current_user.votes.build(post_tile: post_tile)
    if vote.save
      # 投票が成功した場合の処理
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(post_tile, partial: 'posts/post_tile', locals: { post_tile: post_tile })
        end
      end
    end
  end

  def destroy
    post_tile = PostTile.find(params[:post_tile_id])
    if vote = current_user.votes.find_by(post_tile_id: post_tile.id)
      vote&.destroy

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(post_tile, partial: 'posts/post_tile', locals: { post_tile: post_tile })
        end
      end
    end
  end
end
