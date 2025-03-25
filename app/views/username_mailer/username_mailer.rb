class UsernameMailer < ApplicationMailer
  def send_username(user)
    @user = user
    mail(
      to: @user.email,
      subject: "Your Username Information"
    )
  end
end