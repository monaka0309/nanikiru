class RemoveTitleFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :title, :string
  end
end
