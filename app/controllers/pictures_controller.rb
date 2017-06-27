class PicturesController < ApplicationController
	def destroy
		@realestate = Realestate.find(params[:realestate_id])
		@picture = @realestate.pictures.find(params[:id])

		@picture.destroy
    respond_to do |format|
      format.html { redirect_to edit_realestate_path(@realestate), :flash => {:success => t('removed_picture')}}
      format.json { render :edit, status: :ok, location: @realestate }
    end
	end
end
