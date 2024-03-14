# post_tile_idからvoteカラムを削除。
class RemovePostTileIdFromVotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :votes, :post_tile_id, :integer
  end
end
