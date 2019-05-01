# frozen_string_literal: true

module CatsHelper
  def cart_cats_quantity(cat_id)
    @cart_cats.find_by(cat_id: cat_id)&.quantity
  end
end
