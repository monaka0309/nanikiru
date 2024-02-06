tiles = [
    { name: '東', image_path: 'path_to_image_of_east_tile' },
    { name: '南', image_path: 'path_to_image_of_south_tile' },
    # ...他の牌のデータ
  ]

  tiles.each do |tile|
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
