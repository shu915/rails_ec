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

  def calc_total_price
    @cart_products = current_cart.cart_products.includes([:product])

    @total_price = @cart_products.sum do |cart_product|
      if cart_product.product.discouted_price.present?
        cart_product.quantity * cart_product.product.discouted_price
      else
        cart_product.quantity * cart_product.product.price
      end
    end

    @coupon = Coupon.find_by(id: session[:coupon_id])
    if @coupon && !@coupon.is_used
      @total_price -= @coupon.discount_amount
    else
      @total_price
    end
  end
end
