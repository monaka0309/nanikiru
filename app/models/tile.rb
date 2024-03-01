class Tile < ApplicationRecord
    has_many :post_tiles
    has_many :posts, through: :post_tiles
    mount_uploader :image, ImageUploader
end
