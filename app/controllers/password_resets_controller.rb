class PasswordResetsController < ApplicationController
  def new
    # renders form to submit email for password reset
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.generate_password_reset_token!
      # Send email with reset link:
      UserMailer.password_reset(@user).deliver_now
      redirect_to root_path, notice: "Password reset instructions have been sent to your email."
    else
      flash.now[:alert] = "Email address not found."
      render :new
    end
  end

  def edit
    # The token comes in as a parameter. Find the user by token.
    @user = User.find_by(reset_password_token: params[:token])
    unless @user && @user.password_reset_token_valid?
      redirect_to new_password_reset_path, alert: "Password reset link is invalid or has expired."
    end
  end

  def update
    @user = User.find_by(reset_password_token: params[:token])
    if @user && @user.update(user_params)
      @user.clear_password_reset_token!
      redirect_to signin_path, notice: "Your password has been reset successfully."
    else
      flash.now[:alert] = "There was a problem resetting your password."
      render :edit
    end
  end

  private

  def user_params
    # Permit only password and password_confirmation parameters.
    params.require(:user).permit(:password, :password_confirmation)
  end
end