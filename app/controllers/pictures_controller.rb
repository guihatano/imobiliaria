class PicturesController < ApplicationController
	def destroy
		@realestate = Realestate.find(params[:realestate_id])
		@picture = @realestate.pictures.find(params[:id])

		@picture.destroy
    respond_to do |format|
      format.html { redirect_to @realestate, notice: 'Picture was successfully deleted.' }
      format.json { render :edit, status: :ok, location: @realestate }
    end
	end
end
