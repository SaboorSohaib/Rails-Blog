class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
  def create
    @post = Post.new(post_params)
    @post.AuthorId = current_user.id
    @post.like_counter = 0
    @post.comment_counter = 0
    return unless @post.save

    redirect_to posts_new_path
  end

  def new
    @post = Post.new
  end

  def create_comment
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:id])
    @comment.AuthorId = current_user.id
    redirect_to user_post_path if @comment.save
  end

  def create_like
    @like = Like.new(AuthorId: current_user.id, post: Post.find(params[:id]))
    redirect_to user_post_path if @like.save
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
