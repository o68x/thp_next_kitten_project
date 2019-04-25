# frozen_string_literal: true

class ChargesController < ApplicationController
  def new; end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken],
    )

    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'NextKittens Stripe customer',
      currency: 'eur',
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
