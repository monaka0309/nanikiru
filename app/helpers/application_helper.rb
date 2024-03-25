# frozen_string_literal: true

# アプリケーション全体で使用するビューヘルパーメソッドを提供するモジュール。
# これらのヘルパーメソッドは、どのビューからもアクセス可能です。

module ApplicationHelper
  def default_meta_tags
    {
      site: 'nanikiru-mahjang',
      title: 'なにきる 〜麻雀何切る相談所〜',
      reverse: true,
      charset: 'utf-8',
      description: 'なにきるを使えば、どの牌を切ったらいいか相談し意見をもらうことができます。',
      keywords: '麻雀, なにきる',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('logo.jpg'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@buri_osashimi', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('logo.jpg') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
