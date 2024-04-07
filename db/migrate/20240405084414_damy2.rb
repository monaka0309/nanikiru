# frozen_string_literal: true

# マイグレーションファイルを誤って削除していまい、エラーが現れたのでダミーファイルで対応しています。
class Damy2 < ActiveRecord::Migration[7.0]
  def up
    # ダミーのマイグレーションなので中身は空
  end

  def down
    # ダミーのマイグレーションなので中身は空
  end
end
