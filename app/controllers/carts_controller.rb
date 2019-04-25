# frozen_string_literal: true

class CartsController < ApplicationController
  def index

  end

  def show
    puts params
    puts "#" * 50
    @cart = Cart.find(params[:id])
  end
end
