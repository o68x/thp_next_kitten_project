# frozen_string_literal: true

class CartsController < ApplicationController
  def index; end

  def show
    @cart = Cart.find(params[:id])
  end
end
