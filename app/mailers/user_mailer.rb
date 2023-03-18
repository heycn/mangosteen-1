class UserMailer < ApplicationMailer
  def welcome_email(code)
    @code = code
    mail(to: 'heycn@foxmail.com', subject: 'hi')
  end
end
