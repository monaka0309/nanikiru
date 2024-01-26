class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :post_tile, null: false, foreign_key: true # post_tileへの参照に変更
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
