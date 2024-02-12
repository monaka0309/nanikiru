# frozen_string_literal: true

# User モデルはアプリケーションのユーザーを表します。
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :votes
  mount_uploader :image, ImageUploader
  authenticates_with_sorcery!
  validates :name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
