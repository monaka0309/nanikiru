class CreateTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :tiles do |t|
      t.string :name, null: false # 名前は必須
      t.string :image_path, null: false # 画像パスは必須

      t.timestamps
    end
    add_index :tiles, :name, unique: true # タイルの名前はユニークであること
  end
end
