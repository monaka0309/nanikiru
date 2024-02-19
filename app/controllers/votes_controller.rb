
class VotesController < ApplicationController
  before_action :require_login
  before_action :find_post

  def create
    vote = @post.votes.where(user: current_user, choice: params[:choice]).first_or_initialize

    if vote.new_record?
      vote.save
      @status = :created
    else
      vote.destroy
      @status = :destroyed
    end

    respond_to do |format|
      format.html { redirect_to @post }
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace(
          "votes_for_#{post.id}_#{params[:choice].parameterize}",
          partial: "votes/vote_count",
          locals: { post: @post, choice: params[:choice] }
        )
      }
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
