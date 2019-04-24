# frozen_string_literal: true

class AddQuantityColumnToCartCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_cats, :quantity, :integer, default: 1
  end
end
