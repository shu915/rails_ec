# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  description     :text
#  discouted_price :decimal(10, 2)
#  name            :string           not null
#  price           :decimal(10, 2)   not null
#  sku             :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Product < ApplicationRecord
  has_one_attached :image
end
