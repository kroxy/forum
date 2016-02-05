class PostsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :find_post, only: [:show,:edit,:update,:destroy,:upvote]
  def index
    @posts=Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @post=current_user.posts.build
  end

  def create
    @post=current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show

  end

  def edit
  end

  def update

  end
  def upvote
    @post.upvote_by current_user
    redirect_to :back

  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  private
  def find_post
    @post=Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title,:content,:imagess,:upvote)
  end
end
