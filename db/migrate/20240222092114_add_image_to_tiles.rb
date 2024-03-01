class AddImageToTiles < ActiveRecord::Migration[7.0]
  def change
    add_column :tiles, :image, :string
  end
end
