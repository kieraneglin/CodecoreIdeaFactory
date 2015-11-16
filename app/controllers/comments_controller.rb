class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    # render text: params
    comment_params    = params.require(:comment).permit(:comment)

    @idea = Idea.find params[:idea_id]
    @comment = current_user.comments.new(comment_params)
    @comment.idea = @idea
    # byebug
    if @comment.save
      redirect_to idea_path(@idea), notice: "Comment created successfully!"
    else
      # flash[:alert] = @answer.errors.full_messages.join(", ")
      render "idea/show"
    end
  end

  def destroy
    @comment = current_user.comments.find params[:id]
    if @comment.delete
      redirect_to idea_path(params[:idea_id]), notice: "Comment deleted"
    else
      redirect_to root_path
    end
  end
end
