# frozen_string_literal: true

# このマイグレーションは、データベース内に 'posts' テーブルを作成します。
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
