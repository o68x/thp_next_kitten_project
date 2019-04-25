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
end
