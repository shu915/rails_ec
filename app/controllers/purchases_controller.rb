# frozen_string_literal: true

class PurchasesController < ApplicationController
  def create
    @purchase = Purchase.new(purchase_params)

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

    if @purchase.save

      AdminMailer.create_admin_mail(@purchase).deliver_now
      CustomerMailer.create_customer_mail(@purchase).deliver_now
      current_cart.destroy

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
