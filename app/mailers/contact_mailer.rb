class ContactMailer < ApplicationMailer
  def contact_email(name, email, message)
    @name    = name
    @message = message
    @sender  = email

    mail(
      to:      "valeyardvisuals@gmail.com",  # where you want the email to go
      subject: "New Contact Request Received"
    )
  end
end