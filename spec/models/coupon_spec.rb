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
require 'rails_helper'

RSpec.describe Coupon, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
