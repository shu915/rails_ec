# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart
  before_action :set_cart_products_count

  private

  def current_cart
    current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = current_cart.id
    current_cart
  end

  def set_cart_products_count
    @cart_products = current_cart.cart_products.includes([:product])
    @cart_products_count = @cart_products.sum(&:quantity)
  end
end
