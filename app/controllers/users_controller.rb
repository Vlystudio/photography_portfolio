class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Log in the user by setting a persistent cookie.
      cookies.permanent.signed[:user_id] = @user.id
      redirect_to root_path, notice: "Account created successfully and you're now logged in."
    else
      render :new
    end
  end

  def confirm
    @user = User.find(params[:id])
    if @user.confirmation_token == params[:token]
      @user.confirm!
      redirect_to root_path, notice: "Your account has been confirmed."
    else
      redirect_to root_path, alert: "Invalid confirmation token."
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
