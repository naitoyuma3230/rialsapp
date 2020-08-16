class CommentsController < ApplicationController

  def create
    # @post.commentsに:commentを格納
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  

  private
  # postに紐づいた形で:commentが渡される
  def comment_params
    params.require(:comment).permit(:body)
  end

end

