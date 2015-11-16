class JoinsController < ApplicationController
  before_action :authenticate_user
  def create
    j = Join.new
    i = Idea.find params[:idea_id]
    j.user = current_user
    j.idea = i
    if j.save
      redirect_to root_path, notice: "idea joined!"
    else
      redirect_to root_path, alert: "An error occured"
    end
  end
  def destroy
    join = current_user.joins.find params[:id]
    if join.delete
      redirect_to root_path, notice: "Removed from idea"
    else
      redirect_to root_path
    end
  end
end
