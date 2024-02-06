# frozen_string_literal: true

# アプリケーション全体で使用するメーラーの基底クラス。
# 共通の設定やメソッドを定義します。
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
