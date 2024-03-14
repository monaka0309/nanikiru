# PostTileでは投稿時の投票してもらう牌の選択肢のこと。
class PostTile < ApplicationRecord
  belongs_to :post
  belongs_to :tile
  has_many :votes
end
