# frozen_string_literal: true

# アプリケーション全体で使用するビューヘルパーメソッドを提供するモジュール。

module ApplicationHelper
  def show_meta_tags
    assign_meta_tags if display_meta_tags.blank?
    display_meta_tags
  end

  def assign_meta_tags(options = {})
    defaults = t('meta_tags.defaults')
    options.reverse_merge!(defaults)
    site = options[:site]
    title = options[:title]
    description = options[:description]
    keywords = options[:keywords]
    image = options[:image].presence || image_url('logo.jpg')
    configs = {
      site:,
      title:,
      description:,
      keywords:,
      separator: '|',
      reverse: true,
      canonical: request.original_url,
      # icon: {
      #   href: image_url('favicon.icon')
      # },
      og: {
        type: 'website',
        title: title.presence || site,
        description:,
        url: request.original_url,
        image:,
        site_name: site,
        locale: 'ja_JP'
      },
      twitter: {
        site: '@buri_osashimi',
        card: 'summary_large_image',
        image:
      }
    }
    set_meta_tags(configs)
  end
end
