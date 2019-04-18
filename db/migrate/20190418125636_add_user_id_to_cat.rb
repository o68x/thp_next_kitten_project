# frozen_string_literal: true

class AddUserIdToCat < ActiveRecord::Migration[5.2]
  def change
    change_table :cats, bulk: true do |t|
      t.references :user, foreign_key: true, index: true
    end
  end
end
