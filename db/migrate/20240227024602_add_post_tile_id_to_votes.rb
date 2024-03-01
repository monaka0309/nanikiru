class AddPostTileIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :post_tile_id, :bigint
    add_index :votes, :post_tile_id
  end
end
