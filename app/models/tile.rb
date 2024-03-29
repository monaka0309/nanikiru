# 新規投稿時に添付する牌画像のこと。
class Tile < ApplicationRecord
  mount_uploader :image, ImageUploader
  # 画像がimages/tilesディレクトリ内に存在することを検証するカスタムバリデーション
  validate :image_path_must_be_in_tiles_directory

  has_many :votes
  has_many :post_tiles
  has_many :posts, through: :post_tiles
  mount_uploader :image, ImageUploader
end

private

def image_path_must_be_in_tiles_directory
  return if image_path.start_with?('tiles/') && File.exist?(Rails.root.join('app', 'assets', 'images', image_path))

  errors.add(:image_path, 'must be a valid path within the tiles directory')
end
