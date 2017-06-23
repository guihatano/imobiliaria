class MessagesController < ApplicationController

  def new
    if Company.all.present?
      @company = Company.all.first
    end
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    
    if @message.valid?
      ContactMailer.new_message(@message).deliver
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :phone, :content)
  end

end