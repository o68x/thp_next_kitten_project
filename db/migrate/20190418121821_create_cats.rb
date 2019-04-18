# frozen_string_literal: true

class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :title
      t.text :description
      t.integer :age
      t.text :image
      t.decimal :price, precision: 4, scale: 2, default: 0

      t.timestamps
    end
  end
end
