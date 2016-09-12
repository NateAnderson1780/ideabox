class IdeasController < ApplicationController
  before_action :require_login
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :create, :edit]

  def require_login
    redirect_to login_path unless logged_in?
  end
  
  def index 
    @ideas = current_user.ideas 
  end
  
  def show 
  end
  
  def new 
    @idea = Idea.new 
  end
  
  def create 
    @idea = current_user.ideas.new(idea_params)
    if @idea.save 
      flash[:notice] = "You successfully created a book"
      redirect_to user_ideas_path(current_user)
    else
      flash.now[:error] = @idea.errors.full_messages.join(",")
      render :new
    end 
  end
  
  def edit 
  end
  
  def update 
    if @idea.update(idea_params) 
      redirect_to user_ideas_path(current_user)
    else 
      flash.now[:error] = @idea.errors.full_messages.join(",")
      render :edit 
    end
  end
  
  def destroy 
    @idea.destroy 
    
    redirect_to user_ideas_path(current_user)
  end
  
  private 
  
  def idea_params 
    params.require(:idea).permit(:subject, :description, :category_id)
  end
  
  def set_idea 
    @idea = Idea.find(params[:id])
  end
  
  def set_categories 
    @categories = Category.all 
  end
  
  
end