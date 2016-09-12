class ImageIdeasController < ApplicationController
  def new
    @image_ideas = ImageIdeas.new
    @images = Image.all
    @ideas = Idea.where(user_id: params[:user_id])
  end

  def create
    @image_ideas = ImageIdeas.new(image_ideas_params)

    if @image_ideas.save
      redirect_to user_idea_path(current_user, params[:image_ideas][:idea_id])
    else
      flash.now[:notice] = "Image did not save to Idea"
      render :new
    end
  end

private

  def image_ideas_params
    params.require(:image_ideas).permit(:idea_id, :image_id)
  end
end