# frozen_string_literal: true

class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end
end
