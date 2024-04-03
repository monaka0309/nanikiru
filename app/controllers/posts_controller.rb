# frozen_string_literal: true

# 投稿についてのコントローラー
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :correct_user, only: %i[edit update]

  def index
    @posts = Post.includes(:votes).order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @post_tiles = @post.tiles.order(id: :asc).pluck(:image_path)
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @tile_images = Tile.order(id: :asc).pluck(:image_path)
  end

  def edit
    @post = Post.find(params[:id])
    @tile_images = Tile.order(id: :asc).pluck(:image_path)
    @post_tiles = @post.tiles.order(id: :asc).pluck(:image_path)
  end

  def create
    @post = current_user.posts.build(post_params)
    @tile_images = Tile.order(id: :asc).pluck(:image_path)

    if @post.save
      # ここで牌との関連を作成する
      if post_tiles_params['selected_images'].present?
        post_tiles_params['selected_images'].each do |tile_image_path|
          tile_id = Tile.find_by(image_path: tile_image_path).id # tile_id
          @post.post_tiles.create(tile_id: tile_id) if tile_id.present?
        end
      end
      redirect_to @post, notice: I18n.t('posts.create.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      # 投稿に関連する牌の更新処理をここに追加する
      @post.post_tiles.destroy_all
      post_tiles_params['selected_images'].each do |tile_image_path|
        tile_id = Tile.find_by(image_path: tile_image_path).id
        @post.post_tiles.create(tile_id:) if tile_id.present?
      end
      redirect_to @post, notice: I18n.t('posts.update.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: I18n.t('posts.destroy.success')
  end

  # 特定のPost IDに対する選択肢（PostTile）と投票数、および関連するタイルの画像をハッシュ化する
  def post_tiles_with_vote_count(post_id)
    # 関連付けられたレコードを一度に読み込むためにincludesを使用
    Post.find(post_id)
        .post_tiles
        .includes(:tile)
        .map do |post_tile|
          {
            image: post_tile.tile.image,
            count: post_tile.votes.size
          }
        end
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

  def correct_user
    @post = Post.find(params[:id])
    if current_user != @post.user
        redirect_to root_path(current_user)
    end
  end
end
