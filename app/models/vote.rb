# 投票機能についてのこと。
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post_tile # postsとtilesの関係を管理する中間テーブルに対する関連付け

  # 同じpost_tile_idに対して、ユーザーは一回しか投票できないようにする
  validates :post_tile_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :post_tile_id, message: "はすでにこの選択肢に投票しています" }
end
