# frozen_string_literal: true

class AddSellerIdToCat < ActiveRecord::Migration[5.2]
  def change
    add_reference :cats, :seller, index: true
  end
end
