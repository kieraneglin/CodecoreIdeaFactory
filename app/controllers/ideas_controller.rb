class IdeasController < ApplicationController

  #before_action :authenticate_user

  def new
    if user_signed_in?
      @idea = Idea.new
    else
      redirect_to new_session_path, alert: "You must sign in first"
    end
  end

  def create
  #  render text: params
    @idea = Idea.new idea_allowed_params
    @idea.user = current_user

    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def edit
    @idea = Idea.find params[:id]
    check_permission
  end

  def update
    @idea = Idea.find params[:id]
    check_permission

    if @idea.update_attributes(idea_allowed_params)
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find params[:id]
    @comment = Comment.new
  end

  def destroy
    if !can? :delete, @idea
      Idea.destroy params[:id]
      redirect_to root_path, notice: "Idea deleted"
    else
      redirect_to root_path, notice: "nope"
    end
  end

  private

  def idea_allowed_params
    params.require(:idea).permit(:title, :body, :attachment)
  end
  def check_permission
    if !can? :edit, @idea
      redirect_to root_path, notice: "Not permitted"
    end
  end
end
