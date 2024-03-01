class PostTile < ApplicationRecord
  belongs_to :post
  belongs_to :tile
  has_many :votes
end
