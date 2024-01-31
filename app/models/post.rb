class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  # JSONBカラムのアクセッサを設定
  store_accessor :selected_images
end
