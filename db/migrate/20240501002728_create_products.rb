# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.decimal :discouted_price, precision: 10, scale: 2
      t.text :description
      t.string :sku, null: false

      t.timestamps
    end
  end
end
