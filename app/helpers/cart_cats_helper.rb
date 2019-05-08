# frozen_string_literal: true

module CartCatsHelper
  def cat_data_for_seller(cat_id)
    cart_cats = CartCat.where(cat: cat_id)
    cats_data = []
    cart_cats.each do |cart_cat|
      cat_data_for_seller = {}
      cat_data_for_seller[:user] = Cart.find(cart_cat.cart_id).user.profile.first_name
      cat_data_for_seller[:date] = Cart.find(cart_cat.cart_id).order_placed.strftime("%F")
      cat_data_for_seller[:quantity] = cart_cat.quantity
      cat_data_for_seller[:total_price] = cart_cat.quantity
      cats_data << cat_data_for_seller
    end
    p cats_data
    puts "#" * 50
    cats_data
  end
end
