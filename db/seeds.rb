tiles = [
  { name: '東', image_path: 'path_to_image_of_east_tile' },
  { name: '南', image_path: 'path_to_image_of_south_tile' }
  # ...他の牌のデータ
]

tiles.each do |_tile|
  Tile.create(name: '東', image_path: 'tiles/ton.png')
  Tile.create(name: '南', image_path: 'tiles/nan.png')
end

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# tiles = [
#   # マンズ
#   { name: 'iman', image_path: 'iman.jpg' },
#   { name: 'ryanman', image_path: 'ryanman.jpg' },
#   { name: 'sanman', image_path: 'sanman.jpg' },
#   { name: 'suman', image_path: 'suman.jpg' },
#   { name: 'uman', image_path: 'uman.jpg' },
#   { name: 'umanaka', image_path: 'umanaka.jpg' },
#   { name: 'roman', image_path: 'roman.jpg' },
#   { name: 'timan', image_path: 'timan.jpg' },
#   { name: 'paman', image_path: 'paman.jpg' },
#   { name: 'kyuman', image_path: 'kyuman.jpg' },

#   # ピンズ
#   { name: 'ipin', image_path: 'ipin.jpg' },
#   { name: 'ryanpin', image_path: 'ryanpin.jpg' },
#   { name: 'sanpin', image_path: 'sanpin.jpg' },
#   { name: 'supin', image_path: 'supin.jpg' },
#   { name: 'upin', image_path: 'upin.jpg' },
#   { name: 'upinaka', image_path: 'upinaka.jpg' },
#   { name: 'ropin', image_path: 'ropin.jpg' },
#   { name: 'tipin', image_path: 'tipin.jpg' },
#   { name: 'papin', image_path: 'papin.jpg' },
#   { name: 'kyupin', image_path: 'kyupin.jpg' },

#   # ソウズ
#   { name: 'iso', image_path: 'iso.jpg' },
#   { name: 'ryanso', image_path: 'ryanso.jpg' },
#   { name: 'sanzo', image_path: 'sanzo.jpg' },
#   { name: 'suso', image_path: 'suso.jpg' },
#   { name: 'uso', image_path: 'uso.jpg' },
#   { name: 'usoaka', image_path: 'usoaka.jpg' },
#   { name: 'roso', image_path: 'roso.jpg' },
#   { name: 'tiso', image_path: 'tiso.jpg' },
#   { name: 'paso', image_path: 'paso.jpg' },
#   { name: 'kyuso', image_path: 'kyuso.jpg' },

#   # 字牌
#   { name: 'ton', image_path: 'ton.jpg' },
#   { name: 'nan', image_path: 'nan.jpg' },
#   { name: 'sha', image_path: 'sha.jpg' },
#   { name: 'pei', image_path: 'pei.jpg' },
#   { name: 'haku', image_path: 'haku.jpg' },
#   { name: 'hatu', image_path: 'hatu.jpg' },
#   { name: 'tyun', image_path: 'tyun.jpg' },

# ]

# tiles.each do |tile_attributes|
#   tile = Tile.find_or_initialize_by(name: tile_attributes[:name])
#   # 画像パスのフィールドを直接セット
#   tile.image_path = tile_attributes[:image_path]
#   tile.save!
# end
