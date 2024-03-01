class RemoveSelectedImagesFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :selected_images, :jsonb
  end
end