class CommentsController < ApplicationController
    def new
    @comment = Comment.new
    @user = current_user
    end

    def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
      if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @post
         #notice: 'Comment was successfully created.'
      end
    end

    def comment_params
       params.require(:comment).permit(:body)
    end

    def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end
end