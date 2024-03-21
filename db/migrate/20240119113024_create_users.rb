# frozen_string_literal: true

# このマイグレーションは、データベース内に 'users' テーブルを作成します。
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.string :image

      t.string :image

      t.timestamps
    end
  end
end
