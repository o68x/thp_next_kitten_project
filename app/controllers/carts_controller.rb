# frozen_string_literal: true

class CartsController < ApplicationController
  def index; end

  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    current_user.set_current_cart
    redirect_to root_path
  end

  def download_cart_zip
    @cart = Cart.find(params[:cart])
    send_data(ZipCartContent.perform(cart: @cart.id), type: 'application/zip', filename: "NextKittensOrder#{@cart.order_placed.to_formatted_s(:number)[0..-7]}.zip")
    # TODO: CTRL where should we redirect here ?
  end
end
