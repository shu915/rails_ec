# frozen_string_literal: true

# == Schema Information
#
# Table name: purchases
#
#  id           :bigint           not null, primary key
#  address1     :string           not null
#  address2     :string
#  card_number  :string           not null
#  country      :string           not null
#  cvv          :string           not null
#  email        :string           not null
#  expiration   :string           not null
#  firstname    :string           not null
#  lastname     :string           not null
#  name_on_card :string           not null
#  same_address :boolean          default(TRUE)
#  save_info    :boolean          default(TRUE)
#  state        :string           not null
#  username     :string
#  zip_code     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cart_id      :bigint
#
# Indexes
#
#  index_purchases_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id) ON DELETE => nullify
#
require 'rails_helper'

RSpec.describe Purchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
