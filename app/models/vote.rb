class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post_tile

  validates :user_id, uniqueness: { scope: :post_tile_id, message: "はすでにこの選択肢に投票しています" }
end
