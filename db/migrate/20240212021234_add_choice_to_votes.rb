# 投票数を数えるデータベース
class AddChoiceToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :choice, :string
  end
end
