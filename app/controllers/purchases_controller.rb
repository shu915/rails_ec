# frozen_string_literal: true

class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(purchase_params.merge(cart_id: current_cart.id))

    current_cart.cart_products.each do |cart_product|
      product = cart_product.product
      product_price = product.discouted_price.presence || product.price

      @purchase.purchase_products.build(
        product_id: product.id,
        quantity: cart_product.quantity,
        name_at_purchase: product.name,
        price_at_purchase: product_price
      )
    end

    @purchase.coupon_id = session[:coupon_id]
    @purchase.total_price = calc_total_price

    if @purchase.save
      session.delete(:coupon_id)
      flash[:notice] = 'ご購入ありがとうございます'
      redirect_to products_path
    else
      flash[:errors] = @purchase.errors.full_messages
      render 'carts/show', status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:firstname, :lastname, :username, :email, :address1, :address2, :country,
                                     :state, :zip_code, :same_address, :save_info,
                                     :name_on_card, :card_number, :expiration, :cvv)
  end
end
