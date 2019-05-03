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
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id
    if @cat.save
      redirect_to root_path, flash: { success: "Votre image à bien été enregistrer" }
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @cat.update(cat_params)
      redirect_to root_path, notice: "Votre image à bien été editer"
    else
      render 'edit', alert: "Veuillez réessayer"
    end
  end

  def destroy
    @cat.destroy
    redirect_to root_path, notice: "Votre produit à bien été detruit"
  end

  private

  def cat_params
    params.require(:cat).permit(:description, :price, :title, :item_picture)
  end
end
