# frozen_string_literal: true

class RemoveAgeInCatTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :cats, :age, :string
  end
end
