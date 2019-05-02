# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'hello@nextkittens.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Bienvenue chez nous, !')
  end
end
