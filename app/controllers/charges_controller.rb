# frozen_string_literal: true

class ChargesController < ApplicationController
  def new; end

  def create
    # Amount in cents
    @amount = params[:amount].to_i * 100

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

    @cart = Cart.find(params[:cart_id])
    @cart.order_placed = Time.zone.today
    @cart.status = true
    @cart.save
    current_user.set_current_cart
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
