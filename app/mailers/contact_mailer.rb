class ContactMailer < ApplicationMailer

	default from: "Your Mailer <noreply@yourdomain.com>"
	default to: "Your Name <#{ENV['GMAIL_USERNAME']}>"

	def new_message(message)
		@message = message
    
		mail subject: "Message from #{message.name}"
	end

end
