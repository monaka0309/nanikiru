# frozen_string_literal: true

# 投稿についてのコントローラー
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :require_login, only: %i[new create edit update destroy]

  # 投稿一覧を表示
  def index
    @posts = Post.all.order(created_at: :desc) # 新しい投稿が上にくるように並べ替え
  end

  # 特定の投稿を表示
  def show; end

  # 新規投稿フォーム
  def new
    @post = Post.new
  end

  # 投稿編集フォーム
  def edit; end

  # 新規投稿を作成
  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: I18n.t('posts.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, notice: I18n.t('posts.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    redirect_to posts_url, notice: I18n.t('posts.destroy.success')
  end

  private

  # 対象の投稿を設定
  def set_post
    @post = Post.find(params[:id])
  end

  # ストロングパラメーター
  def post_params
    params.require(:post).permit(:content, :image, { selected_images: [] })
  end
end
