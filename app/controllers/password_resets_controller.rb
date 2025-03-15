class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_reset_token!
      UserMailer.password_reset(user).deliver_now
      redirect_to root_path, notice: "Password reset instructions have been sent to your email."
    else
      flash.now[:alert] = "Email address not found."
      render :new
    end
  end

  def edit
    @user = User.find_by(reset_password_token: params[:token])
    unless @user && @user.reset_password_token_expires_at > Time.current
      redirect_to new_password_reset_path, alert: "Password reset link is invalid or has expired."
    end
  end

  def update
    @user = User.find_by(reset_password_token: params[:token])
    if @user && @user.reset_password_token_expires_at > Time.current
      if @user.update(password_params)
        @user.clear_reset_token!
        redirect_to root_path, notice: "Password has been reset."
      else
        render :edit
      end
    else
      redirect_to new_password_reset_path, alert: "Password reset link is invalid or has expired."
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end