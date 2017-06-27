class MessagesController < ApplicationController
  before_action :set_company, only: [:new, :create]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if verify_recaptcha && @message.valid?
      ContactMailer.new_message(@message).deliver
      redirect_to contact_path, :flash => {:success => t(:message_sent)}
    else
      render :new
    end
  end

  private

    def set_company
      if Company.all.present?
        @company = Company.all.first
      end
    end

    def message_params
      params.require(:message).permit(:name, :email, :phone, :content)
    end
end