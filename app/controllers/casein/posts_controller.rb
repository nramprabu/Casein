module Casein
class PostsController < Casein::CaseinController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    5.times { @post.assets.build }
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice]="Successfully created post."
      redirect_to casein_posts_path
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    5.times { @post.assets.build }
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice]="Successfully updated post."
      redirect_to casein_post_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice]="Successfully deleted post."
    redirect_to casein_posts_path
  end
end
end