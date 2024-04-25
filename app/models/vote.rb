# 投票機能についてのこと。
class Vote < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: { scope: :post_tile_id, message: 'はすでにこの選択肢に投票しています' }
  belongs_to :post_tile

  validates :post_tile_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :post_tile_id, message: 'はすでにこの選択肢に投票しています' }

  before_save :destroy_votes_in_post

  private

  def destroy_votes_in_post
    user_id = self.user_id
    post_id = PostTile.find(post_tile_id).post_id
    post_tiles = PostTile.where(post_id: post_id)
    post_tiles.each do |post_tile|
      vote = Vote.find_by(user_id:, post_tile_id: post_tile.id)
      vote.destroy if vote
    end
  end
end
