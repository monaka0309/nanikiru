# frozen_string_literal: true

# User モデルはアプリケーションのユーザーを表します。
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :posts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  def self.looks(search, word)
    if search == "partial_match"
      @user = User.where("%#{word}%")
    else
      @user = User.all
    end
  end
end
