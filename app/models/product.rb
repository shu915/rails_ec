# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  description     :text
#  discouted_price :integer
#  name            :string           not null
#  price           :integer          not null
#  sku             :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_products, dependent: :destroy
  has_many :purchase_products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true
  validates :sku, presence: true, format: { with: /\A[A-Z]{3}-\d{3}\z/ }
  validates :image, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }, if: :attached?

  private

  def attached?
    image.attached?
  end
end
