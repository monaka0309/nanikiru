class AddTitleBackToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string
  end
end
