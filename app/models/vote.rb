class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post_tile # postsとtilesの関係を管理する中間テーブルに対する関連付け

  # バリデーションの追加
  validates :user_id, presence: true
  validates :post_tile_id, presence: true
  # 同じpost_tile_idに対して、ユーザーは一回しか投票できないようにする
  validates :post_tile_id, uniqueness: { scope: :user_id }

end
