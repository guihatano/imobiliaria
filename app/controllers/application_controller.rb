class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :get_company

  private
  def get_company
  	begin
  		@agency = Company.first
  	rescue ActiveRecord::RecordNotFound
  		@agency = nil
  	end
  end
end
