class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :choice, presence: true  # `choice` のバリデーションを追加

end
