# frozen_string_literal: true

class ChangeCartItemsToCartProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :cart_items, :cart_products
  end
end
