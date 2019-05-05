class CommentsController < ApplicationController
  def create
    Comment.create(text: comment_params[:text], tweet_id: tweet_id_params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{params[:tweet_id]}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

  def tweet_id_params
    params.permit(:tweet_id)
  end
end
