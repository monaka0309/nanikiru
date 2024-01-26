tiles = [
    { name: '東', image_path: 'path_to_image_of_east_tile' },
    { name: '南', image_path: 'path_to_image_of_south_tile' },
    # ...他の牌のデータ
  ]
  
  tiles.each do |tile|
    Tile.create(name: '東', image_path: 'tiles/ton.png')
    Tile.create(name: '南', image_path: 'tiles/nan.png')
  end
  