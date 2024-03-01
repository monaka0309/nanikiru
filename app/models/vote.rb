class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post_tile  # post の代わりに post_tile に変更
  validates :choice, presence: true  # `choice` のバリデーションを追加
end
