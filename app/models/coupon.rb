# frozen_string_literal: true

# == Schema Information
#
# Table name: coupons
#
#  id              :bigint           not null, primary key
#  code            :string(7)        not null
#  discount_amount :integer          not null
#  is_used         :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_coupons_on_code  (code) UNIQUE
#
class Coupon < ApplicationRecord
  validates :code, presence: true, length: { is: 7 }
  validates :discount_amount, presence: true,
                              numericality: { only_integer: true,
                                              greater_than_or_equal_to: 100,
                                              less_than_or_equal_to: 1000 }
  has_one :purchase, dependent: :nullify
end
