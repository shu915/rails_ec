# frozen_string_literal: true

class CreatePurchaseProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_products do |t|
      t.references :purchase, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :name_at_purchase, null: false
      t.integer :price_at_purchase, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
