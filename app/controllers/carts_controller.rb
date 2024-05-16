# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @total_price = calc_total_price

    @purchase = Purchase.new
  end

  def create
    @cart_product = current_cart.cart_products.find_or_initialize_by(cart_id: session[:cart_id],
                                                                     product_id: cart_product_params[:product_id])
    @cart_product.quantity += cart_product_params[:quantity].to_i
    if @cart_product.save
      flash[:notice] = "#{@cart_product.product.name}が追加されました。"
    else
      flash[:errors] = '商品の追加に失敗しました。'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart_product = CartProduct.find(cart_product_params[:id])
    @cart_product.destroy
    redirect_to cart_path
  end

  def coupon_check
    @coupon = Coupon.find_by(code: coupon_params[:code])
    session[:coupon_id] = @coupon.id if @coupon
    redirect_to cart_path
  end

  private

  def cart_product_params
    params.permit(:id, :product_id, :quantity)
  end

  def coupon_params
    params.permit(:code)
  end
end
