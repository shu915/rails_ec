# frozen_string_literal: true

# == Schema Information
#
# Table name: purchase_products
#
#  id                :bigint           not null, primary key
#  name_at_purchase  :string           not null
#  price_at_purchase :integer          not null
#  quantity          :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  product_id        :bigint           not null
#  purchase_id       :bigint           not null
#
# Indexes
#
#  index_purchase_products_on_product_id   (product_id)
#  index_purchase_products_on_purchase_id  (purchase_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (purchase_id => purchases.id)
#
require 'rails_helper'

RSpec.describe PurchaseProduct, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
