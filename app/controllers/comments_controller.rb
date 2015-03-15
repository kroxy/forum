class CommentsController < ApplicationController
  def create
    if user_signed_in?
    @post=Post.find(params[:post_id])
    @comment=@post.comments.create(params[:comment].permit(:content))
    @comment.user_id=current_user.id
    if @comment.save
      redirect_to posts_path(@post)
    else
      render 'new'
    end
    else
      redirect_to new_user_session_path
    end
    end
end
