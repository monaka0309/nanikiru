# frozen_string_literal: true

# Post モデルはユーザーによる投稿を表し、ユーザーと1対1の関連を持ちます。
# それぞれの投稿は、画像アップロード機能をサポートし、
# `image` 属性を介して画像ファイルをアップロードできます。
class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :votes
end
