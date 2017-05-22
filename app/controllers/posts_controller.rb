class PostsController < ApplicationController
include PostsHelper

  # GET /posts
  # GET /posts.json

  def new
    $classpage = Classpage.find(params[:classpage])
    @post = Post.new
  end

  def create
   
    
    @post = $classpage.posts.build(post_params)
    @post.user_id = current_user.id
    @post.classpage_id = $classpage.id
    if @post.save
      flash[:success] = "Micropost created!"
      redirect_to $classpage
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #@classpage = Classpage.find(params[:classpage_id])
    @user = User.find(@post.id)
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def post_params
      params.require(:post).permit(:title, :body, :picture).merge(user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
      def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

end