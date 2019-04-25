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
      if current_cart.cart_cats.find_by(cat_id: params[:id])
        @cart_cat = current_cart.cart_cats.find_by(cat_id: params[:id])
        @cart_cat.increment_quantity
      else
        @cart_cat = CartCat.new(cart_id: current_cart.id, cat_id: params[:id], price: params[:price])
        # TODO: flash message on cat save
      end
      if @cart_cat.save
        flash[:success] = "Cat was successfully saved to cart."
      else
        flash[:alert] = "There was a problem. Cat was not saved to cart."
      end
    else
      # TODO: change this to more user friendly redirection?
      flash[:alert] = "You must login to use your cart"
      redirect_to new_user_session_path
    end
  end

  def destroy
    @cart_cat = CartCat.find(params[:id])
    @cart_cat.destroy
    redirect_to cart_path(current_user.current_cart)
  end  

  delegate :current_cart, to: :current_user
end
