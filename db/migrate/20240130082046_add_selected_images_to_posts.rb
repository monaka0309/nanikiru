# frozen_string_literal: true

# このマイグレーションは、'posts' テーブルに 'selected_images' 列を追加します。
class AddSelectedImagesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :selected_images, :jsonb, default: []
  end
end
