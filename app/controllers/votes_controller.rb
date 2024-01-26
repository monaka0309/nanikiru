class VotesController < ApplicationController
    def create
      tile = Tile.find(params[:tile_id])
      vote = tile.votes.create # ここで投票を保存するロジックを実装します
      render json: { tile_id: tile.id, votes_count: tile.votes.count }
    end
end
