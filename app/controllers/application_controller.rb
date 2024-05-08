# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart
  before_action :set_cart_item_count

  private

  def current_cart
    if session[:cart_id].present?
      current_cart = Cart.find_by(id: session[:cart_id])
      return current_cart unless current_cart.nil?

      session[:cart_id] = nil

    end

    current_cart = Cart.create
    session[:cart_id] = current_cart.id
    current_cart
  end

  def set_cart_item_count
    @cart_items = current_cart.cart_items.includes([:product])
    @cart_item_count = @cart_items.sum(&:quantity)
  end
end
