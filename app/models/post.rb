# frozen_string_literal: true

# Post モデルはユーザーによる投稿を表し、ユーザーと1対1の関連を持ちます。それぞれの投稿は、画像アップロード機能をサポートし、`image` 属性を介して画像ファイルをアップロードできます。

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :post_tiles, dependent: :destroy
  has_many :tiles, through: :post_tiles
  has_many :votes, through: :post_tiles, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  paginates_per 20
end
