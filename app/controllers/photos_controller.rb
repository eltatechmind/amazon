class PhotosController < ApplicationController

	def index
		@photo = Photo.all
	end

    def new
		@photo = Photo.new
	end

	def create
	  @photo = Photo.new(photo_params)
	  @photo.save
	  redirect_to @photo
	end

	def show
		@photo = Photo.find(params[:id])
	end



	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		@photo.update_attributes(photo_params)
		redirect_to @photo
	end

	def destroy
		Photo.find(params[:id]).destroy
	end


	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def photo_params
	  params.require(:photo).permit(:id, :image, :item_id)
	end

end
