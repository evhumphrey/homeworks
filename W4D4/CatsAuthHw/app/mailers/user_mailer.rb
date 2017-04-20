class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/session/new'
    # NOTE: this would require a user to have email in production
    mail(to: user.username, subject: 'Welcome to CAT WORLD!')
  end
end
