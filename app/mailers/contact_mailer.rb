class ContactMailer < ApplicationMailer
  default to: "Valeyardvisuals@gmail.com"

  def contact_email(name, email, message)
    @name = name
    @message = message
    mail(from: email, subject: "New Contact Request from #{@name}") do |format|
      format.text   # Force Rails to use contact_email.text.erb
    end
  end
end