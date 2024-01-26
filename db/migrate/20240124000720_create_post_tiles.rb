class CreatePostTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tiles do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
