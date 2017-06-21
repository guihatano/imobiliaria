class RealestatesController < ApplicationController
  before_action :set_realestate, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /realestates
  # GET /realestates.json
  def index
    @realestates = Realestate.all
    # if realestate doesn't have image, the html.erb code won't work
    # using .with_images will prevent this
    @carousel = Realestate.with_images.limit(3).order('id desc')
  end

  # GET /realestates/1
  # GET /realestates/1.json
  def show
  end

  # GET /realestates/new
  def new
    @realestate = Realestate.new
  end

  # GET /realestates/1/edit
  def edit
  end

  # POST /realestates
  # POST /realestates.json
  def create
    @realestate = Realestate.new(realestate_params)

    respond_to do |format|
      if @realestate.save
        picture_params.each { |image| @realestate.pictures.create(image: image) } if picture_params

        format.html { redirect_to @realestate, notice: 'Realestate was successfully created.' }
        format.json { render :show, status: :created, location: @realestate }
      else
        format.html { render :new }
        format.json { render json: @realestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realestates/1
  # PATCH/PUT /realestates/1.json
  def update
    respond_to do |format|
      if @realestate.update(realestate_params)
        picture_params.each { |image| @realestate.pictures.create(image: image) } if picture_params

        format.html { redirect_to @realestate, notice: 'Realestate was successfully updated.' }
        format.json { render :show, status: :ok, location: @realestate }
      else
        format.html { render :edit }
        format.json { render json: @realestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realestates/1
  # DELETE /realestates/1.json
  def destroy
    @realestate.destroy
    respond_to do |format|
      format.html { redirect_to realestates_url, notice: 'Realestate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realestate
      @realestate = Realestate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def realestate_params
      params.require(:realestate).permit(:re_type, :street, :district, :city, :state, :category, :price, :description, :cover)
    end

    def picture_params
      params.fetch(:images, {})
    end
end
