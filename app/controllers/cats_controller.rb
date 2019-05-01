# frozen_string_literal: true

class CatsController < ApplicationController
  def index
    @cats = Cat.where('is_available').order("created_at desc")
    @cart_cats = current_cart.cart_cats if user_signed_in?
  end

  def show
    @cat = Cat.find(params[:id])
  end
end
