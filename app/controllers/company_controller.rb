class CompanyController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :show]
	before_action :set_company, only: [:edit, :update, :destroy, :show]

	def index
		@companies = Company.all
	end

	def show
	end

	def new
		if Company.all.empty?
			@company = Company.new
		else
			flash[:notice] = t('error_new_company')
			redirect_to company_path
		end
	end

	def edit
	end

	def create
		@company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :creci, :street, :st_number, :district, :city, :state, :email, :phone, :cellphone, :facebook, :instagram, :twitter, :google_plus)
    end
	
end
