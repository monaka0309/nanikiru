class AddPostIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :post_id, :integer
    add_index :votes, :post_id
  end
end
