class UsernameResetsController < ApplicationController
  def new
    # Renders the username reset form
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      # Send the username reset instructions via email
      UserMailer.username_reset(@user).deliver_now
      redirect_to root_path, notice: "Instructions to recover your username have been sent to your email."
    else
      flash.now[:alert] = "Email address not found."
      render :new
    end
  end
end
