# frozen_string_literal: true

class AddSelectedImagesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :selected_images, :jsonb, default: []
  end
end
