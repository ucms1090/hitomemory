class Public::PostsController < ApplicationController

  def search
    @posts = Post.all
    @q = Post.ransack(params[:q])
    @post = @q.result
  end

  def index
    @posts = Post.where(memory_id: current_memory.id)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.memory_id = current_memory.id
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "success"
    else
      render edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to memory_root_path
  end

  private

  def post_params
    params.require(:post).permit(:memory_id, :user_id, :search_word, :title, :content, :start_time, :post_image)
  end

end
