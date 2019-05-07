# frozen_string_literal: true

class CatsController < ApplicationController
  def index
    @cats = Cat.where('is_available').order("created_at desc")
    @cart_cats = current_cart.cart_cats if user_signed_in?
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    if user_signed_in?
      cat_params = params.require(:cat).permit(:description, :price, :title, :item_picture)
      @cat = Cat.new(cat_params)
    else
      flash[:alert] = "You must login to use your cart"
      redirect_to new_user_session_path
    end
    if @cat.save
      @cat.update(seller_id: current_user.id)
      redirect_to root_path, flash: { success: "Votre image à bien été enregistrer" }
    else
      render 'new'
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    cat_params = params.permit(:description, :price, :title, :item_picture)
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to root_path, notice: "Votre image à bien été editer"
    else
      render 'edit', alert: "Veuillez réessayer"
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to root_path, notice: "Votre produit à bien été detruit"
  end

  private

  def seller_cat
    @seller = Cat.find(params[:id]).user_id
  end
end
