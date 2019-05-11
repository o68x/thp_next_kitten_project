# frozen_string_literal: true

module CatsHelper
  def cart_cats_quantity(cat_id)
    @id = cat_id
    CartCat.find_by(cat_id: @id)&.quantity if user_signed_in?
  end

  def seller_email(cat)
    cat.seller ? cat.seller.email : "NextKittens"
  end
end
