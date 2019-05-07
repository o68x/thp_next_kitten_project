# frozen_string_literal: true

module Admin
  class CatsController < AdminController
    def index
      @cats = Cat.all.order(:id).reverse
    end

    def new
      @cat = Cat.new
    end

    def create
      @cat = Cat.new(title: params[:title], description: params[:description], price: params[:price])
      @cat.item_picture.attach(params[:item_picture])

      if @cat.save
        redirect_to admin_cats_path, flash: { success: "New image created" }
      else
        render 'index'
      end
    end

    def show
      @cat = Cat.find(params[:id])
    end

    def edit
      @cat = Cat.find(params[:id])
    end

    def update
      cat_params = params.permit(:title, :description, :price, :is_available)

      if !params[:item_picture].nil?
        @cat.item_picture.attach(params[:item_picture])
      end

      if @cat.update(cat_params)
        redirect_to admin_cats_path, flash: { success: "Item updated" }
      else
        render 'index'
      end
    end

    def destroy
      @cat = Cat.find(params[:id])
      @cat.destroy
      redirect_to admin_cats_path
    end
  end
end
