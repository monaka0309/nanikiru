# コメントについてのコントローラー
class CommentsController < ApplicationController
    before_action :require_login

    def create
        post = Post.find(params[:post_id])
        comment = current_user.comments.new(comment_params)
        comment.post_id = post.id
        comment.save
        redirect_to post_path(post)
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to post_path(params[:post_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

end
