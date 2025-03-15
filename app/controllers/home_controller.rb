class HomeController < ApplicationController
  def index
    # You can render a home page view here or add any logic as needed.
  end

  def wildlife
    @photos = Photo.where(category: 'wildlife')
  end

  def portrait
    @photos = Photo.where(category: 'portrait')
  end

  def cars
    @photos = Photo.where(category: 'car')
  end

  def contact
    # Display the contact page
  end

  def contact_submit
  name = params[:name]
  email = params[:email]
  message = params[:message]

  begin
    ContactMailer.contact_email(name, email, message).deliver_now
  rescue EOFError => e
    Rails.logger.warn "EOFError occurred during email delivery: #{e.message}"
    # Optionally, you can notify yourself via some logging service if needed.
  end

  redirect_to contact_path, notice: "Your message was sent!"
  end
end