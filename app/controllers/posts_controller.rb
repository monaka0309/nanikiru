# frozen_string_literal: true

# 投稿についてのコントローラー
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :require_login, only: %i[new create edit update destroy]

  # 投稿一覧を表示
  def index
    @posts = Post.includes(:votes).order(created_at: :desc)
  end

  # 特定の投稿を表示
  def show; end

  # 新規投稿フォーム
  def new
    @post = Post.new
    @tile_images = Tile.all.order(id: :asc).pluck(:image_path)
  end

  # 投稿編集フォーム
  def edit
    @post = Post.find(params[:id])
    @tile_images = Tile.all.order(id: :asc).pluck(:image_path)
    @post_tiles = @post.tiles.order(id: :asc).pluck(:image_path)
  end

  # 新規投稿を作成
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      # ここで牌との関連を作成する
      # post_tiles_params = ["i-man.png","ryan-man.png"]
      post_tiles_params["selected_images"].each do |tile_image_path|
        # tile_image_path = "i-man.png"
        tile_id = Tile.find_by(image_path: tile_image_path).id # tile_id
        @post.post_tiles.create(tile_id: tile_id) unless tile_id.blank?
      end
      redirect_to @post, notice: I18n.t('posts.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      # 投稿に関連する牌の更新処理をここに追加する
      @post.post_tiles.destroy_all
      params[:post][:post_tiles].each do |tile_id|
        @post.post_tiles.create(tile_id: tile_id) unless tile_id.blank?
      end
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
  # 投稿自体を作るためのパラメータ(=postsテーブル)
  def post_params
    params.require(:post).permit(:content, :image)
  end

  # 投稿に紐づく牌がどれかを選択するためのパラメータ(=post_tilesテーブル)
  def post_tiles_params
    params.require(:post).permit(selected_images: [])
  end
end
