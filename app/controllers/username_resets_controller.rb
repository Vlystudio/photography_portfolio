class UsernameResetsController < ApplicationController
  def new
    # Renders a form where the user enters their email.
  end

  def create
    email = params[:email].to_s.downcase
    @user = User.find_by(email: email)
    
    if @user
      UsernameMailer.send_username(@user).deliver_now
      flash[:info] = "An email has been sent with your username information."
      redirect_to root_path
    else
      flash.now[:danger] = "Email address not found."
      render :new
    end
  end
end