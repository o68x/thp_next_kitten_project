# frozen_string_literal: true

class CartCatsController < ApplicationController
  def new
    @cart_cat = CartCat.new(params)
    @current_cart = current_cart
  end

  def create
    if user_signed_in?
      # use this condition instead of before_action
      # so that we can redirect to some other page with
      # message instead of simple login
      @cart_cat = CartCat.new(cart_id: current_cart.id, cat_id: params[:id], price: params[:price])
      # TODO: flash message on cat save
      if @cart_cat.save
        flash[:success] = "Cat was successfully saved to cart"
      else
        flash[:alert] = "Cat not saved to cart"
      end
    else
      # TODO: change this for a better redirection
      redirect_to new_user_session_path
    end
  end

  delegate :current_cart, to: :current_user
end
