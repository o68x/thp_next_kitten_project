# frozen_string_literal: true

module CatsHelper
  def current_cart_cats_quantity(cat_id)
    @id = cat_id
    CartCat.where(cart_id: current_cart).find_by(cat_id: @id)&.quantity if user_signed_in?
  end

  def seller_email(cat)
    cat.seller ? cat.seller.email : "NextKittens"
  end
end
