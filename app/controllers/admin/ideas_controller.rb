class Admin::IdeasController < Admin::BaseController 
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:update, :edit, :create, :new]
  before_action :set_categories, only: [:update, :edit, :create, :new]
  
  def index 
    @ideas = Idea.all 
  end
  
  def show 
    
  end
  
  def new 
    @idea = Idea.new
  end
  
  def create 
    @idea = Idea.new(idea_params)
    if @idea.save 
      redirect_to admin_ideas_path
    else 
      flash.now[:error] = @idea.errors.full_messages.join(",")
      render :new 
    end
  end
  
  def edit 
    
  end
  
  def update 
    if @idea.update(idea_params)
      redirect_to admin_idea_path(@idea)
    else 
      flash.now[:error] = @idea.errors.full_messages.join(",")
      render :edit 
    end
  end
  
  def destroy 
    @idea.destroy 
    
    redirect_to admin_ideas_path
  end
  
  private 
  
  def idea_params 
    params.require(:idea).permit(:subject, :description, :category_id, :user_id)
  end
  
  def set_users 
    @user = User.all
  end
  
  def set_idea 
    @idea = Idea.find(params[:id])
  end
  
  def set_categories 
    @categories = Category.all 
  end
end