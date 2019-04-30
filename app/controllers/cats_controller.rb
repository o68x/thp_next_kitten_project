# frozen_string_literal: true

class CatsController < ApplicationController
  def index
    @cats = Cat.where('is_available').order("created_at desc")
  end

  def show
    @cat = Cat.find(params[:id])
  end
end
