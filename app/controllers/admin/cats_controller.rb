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
        redirect_to admin_cat_path(@cat.id), success: "Nouvel item créé !"
      else
        render 'new'
      end
    end

    def show
      @cat = Cat.find(params[:id])
    end

    def edit
      @cat = Cat.find(params[:id])
    end

    def update
      @cat = Cat.find(params[:id])
      cat_params = params.permit(:title, :description, :price)

      if !params[:item_picture].nil?
        @cat.item_picture.attach(params[:item_picture])
      end

      if @item.update(cat_params)
        redirect_to admin_cat_path(@cat.id), notice: "L'item a bien été mis à jour"
      else
        render :show
      end
    end

    def destroy
      @cat = Cat.find(params[:id])
      @cat.destroy
      redirect_to admin_cats_path
    end
  end
end
