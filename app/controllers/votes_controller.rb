class VotesController < ApplicationController
  before_action :require_login
  before_action :find_post

  def create
    # ユーザーの現在の投票を検索します。
    current_vote = @post.votes.find_by(user: current_user)

    if current_vote
      if current_vote.choice == params[:choice]
        # 同じ選択肢に対する既存の投票を削除します。
        current_vote.destroy
        @status = :destroyed
      else
        # 選択肢を更新します。
        current_vote.update(choice: params[:choice])
        @status = :updated
      end
      @vote = current_vote
    else
      # 新しい投票を作成します。
      @vote = @post.votes.create(user: current_user, choice: params[:choice])
      @status = :created
    end

    # レスポンスのフォーマットを処理します。
    respond_to do |format|
      # format.html { redirect_to @post }
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace(
          "votes_for_#{@post.id}_#{params[:choice].parameterize}",
          partial: "votes/vote_count",
          locals: { post: @post, choice: params[:choice], status: @status }
        )
      }
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end

