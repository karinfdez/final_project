class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url='https://party-events.herokuapp.com/users/sign_in'
    #The receiver of the email
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Art Project Community')
  end
end
