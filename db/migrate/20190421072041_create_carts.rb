# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.boolean    :status, null: false, default: false
      t.datetime   :order_placed
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
