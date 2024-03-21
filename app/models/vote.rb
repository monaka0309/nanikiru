# 投票機能についてのこと。
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post_tile

  validates :user_id, uniqueness: { scope: :post_tile_id, message: 'はすでにこの選択肢に投票しています' }
  belongs_to :post_tile # postsとtilesの関係を管理する中間テーブルに対する関連付け

  # 同じpost_tile_idに対して、ユーザーは一回しか投票できないようにする
  validates :post_tile_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :post_tile_id, message: "はすでにこの選択肢に投票しています" }

  before_save :destroy_votes_in_post

  private

    def destroy_votes_in_post
      # user_id, post_tile_idがインスタンス（レシーバー）に含まれる。save前の動作だから一つ。
      user_id = self.user_id
      post_id = PostTile.find(self.post_tile_id).post_id
      post_tiles = PostTile.where(post_id: post_id)
      post_tiles.each do |post_tile|
        vote = Vote.find_by(user_id: user_id, post_tile_id: post_tile.id)
        if vote
          vote.destroy
        end
      end
    end
end
