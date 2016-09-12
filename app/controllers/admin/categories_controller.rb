class Admin::CategoriesController < Admin::BaseController 
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  
  def index 
    @categories = Category.all 
  end
  
  def show 
    
  end
  
  def new 
    @category = Category.new
  end
  
  def create 
    @category = Category.new(category_params)
    if @category.save 
      redirect_to admin_categories_path
    else 
      flash.now[:error] = @category.errors.full_messages.join(",")
      render :new 
    end
  end
  
  def edit 
    
  end
  
  def update 
    if @category.update(category_params)
      redirect_to admin_category_path(@category)
    else 
      flash.now[:error] = @category.errors.full_messages.join(",")
      render :edit 
    end
  end
  
  def destroy 
    @category.destroy 
    
    redirect_to admin_categories_path
  end
  
  private 
  
  def category_params 
    params.require(:category).permit(:genre)
  end
  
  def set_category 
    @category = Category.find(params[:id])
  end
end