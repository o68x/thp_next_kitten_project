# frozen_string_literal: true

class AddIsAvailableToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :is_available, :boolean, default: true
  end
end
