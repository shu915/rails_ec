# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :username
      t.string :email, null: false
      t.string :address1, null: false
      t.string :address2
      t.string :country, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.boolean :same_address, default: true
      t.boolean :save_info, default: true

      t.string :name_on_card, null: false
      t.string :card_number, null: false
      t.string :expiration, null: false
      t.string :cvv, null: false

      t.timestamps
    end
  end
end
