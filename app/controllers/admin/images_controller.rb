class Admin::ImagesController < Admin::BaseController 
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  
  
  def index 
    @images = Image.all 
  end
  
  def show 
    
  end
  
  def new 
    @image = Image.new
  end
  
  def create 
    @image = Image.new(image_params)
    if @image.save 
      redirect_to admin_images_path
    else 
      flash.now[:error] = @image.errors.full_messages.join(",")
      render :new 
    end
  end
  
  def edit 
    
  end
  
  def update 
    if @image.update(image_params)
      redirect_to admin_image_path(@image)
    else 
      flash.now[:error] = @image.errors.full_messages.join(",")
      render :edit 
    end
  end
  
  def destroy 
    @image.destroy 
    
    redirect_to admin_images_path
  end
  
  private 
  
  def image_params 
    params.require(:image).permit(:url, :name)
  end
  
  def set_image 
    @image = Image.find(params[:id])
  end
end