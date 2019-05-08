# frozen_string_literal: true

class AddFulladdressToProfiles < ActiveRecord::Migration[5.2]
  def change
    change_table :profiles, bulk: true do |t|
      t.string :country
      t.string :city
      t.string :zip_code
    end
  end
end
