# frozen_string_literal: true

module CatsHelper
  def cart_cats_quantity(cat_id)
    @cart_cats.find_by(cat_id: cat_id)&.quantity if user_signed_in?
  end

  def seller_email(cat)
    cat.seller ? cat.seller.email : "NextKittens"
  end
end
