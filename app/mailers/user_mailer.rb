class UserMailer < ApplicationMailer
  default from: "Valeyardvisuals@gmail.com"

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: "Confirm your account")
  end

  def password_reset(user)
    @user = user
    mail(to: @user.email, subject: "Password Reset Instructions")
  end

  def username_reset(user)
    @user = user
    mail(to: @user.email, subject: "Recover Your Username")
  end
end
