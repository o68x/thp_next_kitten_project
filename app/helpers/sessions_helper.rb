# frozen_string_literal: true

module SessionsHelper
  def current_cart
    @current_cart ||= current_user.current_cart if user_signed_in?
  end
end
