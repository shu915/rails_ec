# frozen_string_literal: true

class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :code, limit: 7, null: false
      t.integer :discount_amount, null: false
      t.boolean :is_used, null: false, default: false

      t.timestamps
    end

    add_index :coupons, :code, unique: true
  end
end
