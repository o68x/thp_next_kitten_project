# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'hello@nextkittens.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Bienvenue chez nous, !')
  end

  def order_checkout_email(user)
    @user = user
    @cart_cat = @user.cart_cat
    @url = 'http://localhost:3000/'
    mail(to: @cart_cat.user.email, subject: 'Votre commande chez NextKittens.com')
  end
end
