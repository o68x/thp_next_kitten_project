# frozen_string_literal: true

class CreateCartCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_cats do |t|
      t.decimal    :price, precision: 5, scale: 2
      t.references :cart, foreign_key: true, index: true
      t.references :cat, foreign_key: true, index: true

      t.timestamps
    end
  end
end
