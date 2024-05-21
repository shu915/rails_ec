# frozen_string_literal: true

class AddCouponDiscountAndTotalPriceToPurchase < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :coupon, foreign_key: true
    add_column :purchases, :total_price, :integer
  end
end
