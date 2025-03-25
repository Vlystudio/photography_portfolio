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
  # Combine first and last name, or keep them separate if you like
  full_name = "#{params[:first_name]} #{params[:last_name]}"

  # Pull out the rest of the params
  email   = params[:email]
  message = params[:message]

  # Pass these to the mailer
  ContactMailer.contact_email(full_name, email, message).deliver_now

  # (Optional) redirect or render something
  redirect_to root_path, notice: "Your message was sent!"
  rescue EOFError => e
  Rails.logger.warn "EOFError occurred during email delivery: #{e.message}"
  # handle error or redirect with flash
  end
end