# frozen_string_literal: true

class AddCartIdToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :cart, foreign_key: { on_delete: :nullify }
  end
end
