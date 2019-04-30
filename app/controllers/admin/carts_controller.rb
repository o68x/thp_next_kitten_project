# frozen_string_literal: true

module Admin
  class CartsController < AdminController
    def index
      @carts = Cart.all
    end

    def new
      @cart = Cart.new
    end

    def show
      @cart = Cart.find(params[:id])
    end
  end
end
