# frozen_string_literal: true

# User モデルはアプリケーションのユーザーを表します。
# ユーザーは名前、ニックネーム、メールアドレスを持ち、Sorceryライブラリを使用して認証機能を実装しています。
# ユーザーはパスワードを使って登録・ログインでき、パスワードは確認用と一致する必要があります。
# また、ユーザーはプロフィール画像をアップロードでき、
# そのためにImageUploaderがマウントされています。
class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  authenticates_with_sorcery!
  validates :name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
