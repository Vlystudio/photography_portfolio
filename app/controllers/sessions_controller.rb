class SessionsController < ApplicationController
  def new
    # Renders the sign-in form (app/views/sessions/new.html.erb)
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      cookies.permanent.signed[:user_id] = user.id
      redirect_to root_path, notice: "Signed in successfully."
    else
      flash.now[:alert] = "Invalid username or password."
      render :new
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to root_path, notice: "Signed out successfully."
  end
end
