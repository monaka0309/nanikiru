# frozen_string_literal: true

class VotesController < ApplicationController
  before_action :require_login

  def create
    post_tile = PostTile.find(params[:post_tile_id])
    vote = current_user.votes.build(post_tile: post_tile)
    if vote.save
      # 投票が成功した場合の処理
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(post_tile, partial: 'posts/post_tile', locals: { post_tile: post_tile })
        end
      end
    end
    # if vote = current_user.votes.find_by(post_tile_id: post_tile.id)
    #   vote&.destroy

    #   respond_to do |format|
    #     format.turbo_stream do
    #       render turbo_stream: turbo_stream.replace(post_tile, partial: 'posts/post_tile', locals: { post_tile: post_tile })
    #     end
    #   end
    # else
    #   vote = current_user.votes.build(post_tile: post_tile)

    #   if vote.save
    #     # 投票が成功した場合の処理
    #     respond_to do |format|
    #       format.turbo_stream do
    #         render turbo_stream: turbo_stream.replace(post_tile, partial: 'posts/post_tile', locals: { post_tile: post_tile })
    #       end
    #     end
    #   end
    # end
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


    # if vote = current_user.votes.find_by(post_tile_id: post_tile.id)
    #   vote&.destroy

    #   respond_to do |format|
    #     format.turbo_stream do
    #       render turbo_stream: turbo_stream.replace(post_tile, partial: 'posts/post_tile', locals: { post_tile: post_tile })
    #     end
    #   end
    # else
    #   vote = current_user.votes.build(post_tile: post_tile)

    #   if vote.save
    #     # 投票が成功した場合の処理
    #     respond_to do |format|
    #       format.turbo_stream do
    #         render turbo_stream: turbo_stream.replace(post_tile, partial: 'posts/post_tile', locals: { post_tile: post_tile })
    #       end
    #     end
    #   end
    # end
end
