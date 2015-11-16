class LikesController < ApplicationController
  before_action :authenticate_user
  def create
    like = Like.new
    idea = Idea.find params[:idea_id]
    like.user = current_user
    like.idea = idea
    if like.save
      redirect_to root_path, notice: "Liked!"
    else
      redirect_to root_path, alert: "An error occured"
    end
  end
  def destroy
    like = current_user.likes.find params[:id]
    if like.delete
      redirect_to root_path, notice: "Like removed!"
    else
      redirect_to root_path
    end
  end
end
