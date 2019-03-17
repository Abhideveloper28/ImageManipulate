class ImagesController < ApplicationController

  before_action :set_image, only: [:edit, :destroy, :resize]
	
  #Index action, images gets listed in the order at which they were created
	def index
	  @images = Image.order('created_at')
	end

	#New action for creating a new image
	def new
	  @image = Image.new
	end

	#Create action ensures that submitted image gets created if it meets the requirements
	def create
	  @image = Image.new(image_params)
	  if @image.save
	   flash[:notice] = "Successfully added new image!"
	   redirect_to root_path
	  else
	   flash[:alert] = "Error adding new image!"
	   render :new
	  end
	end

	def destroy
		if @image.destroy
			flash[:notice] = "Successfully deleted image!"
			redirect_to root_path
		else
			flash[:alert] = "Error deleting image!"
		end
	end

	def edit
	end

	def resize
    ImageUtil.resize_uploaded_image(@image, params[:width].to_i, params[:height].to_i)
    flash[:notice] = "Successfully resized image!"
    redirect_to root_path
	end

	private

	#Permitted parameters when creating a image. This is used for security reasons.
	def image_params
	  params.require(:image).permit(:title, :image)
	end

  # set image from image params
  def set_image
    @image = Image.find(params[:id])
  end
end