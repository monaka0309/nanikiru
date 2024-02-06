# frozen_string_literal: true

# ユーザーのメールアドレスに一意性のインデックスを追加するためのマイグレーション
class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, unique: true
  end
end
