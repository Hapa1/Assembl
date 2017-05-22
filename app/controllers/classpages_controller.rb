class ClasspagesController < ApplicationController

  def new
    @classpage = Classpage.new
    @user = current_user
  end

  def show

    @classpages  = Classpage.find(params[:id])
    @posts = @classpages.posts.paginate(page: params[:page])
    @post = current_user.posts.build if logged_in?

  end

    def current_classpage
      @current_classpage = Classpage.find_by_id(params[:id])
    end
  

  def create
    @classpages = Classpage.new(user_params)
    if @classpages.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def index
    @classpages = Classpage.paginate(page: params[:page])
  end

  def edit
    @classpages = Classpage.find(params[:id])
  end
end
  

