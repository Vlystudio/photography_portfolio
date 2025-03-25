class UserMailer < ApplicationMailer
  def password_reset(user)
    @user = user
    # Generate the reset link (using a token query parameter)
    @reset_link = edit_password_reset_url(token: @user.reset_password_token)
    mail(
      to: @user.email,
      subject: "Reset Your Password"
    )
  end
end