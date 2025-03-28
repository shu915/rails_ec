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
#  total_price  :integer
#  username     :string
#  zip_code     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cart_id      :bigint
#  coupon_id    :bigint
#
# Indexes
#
#  index_purchases_on_cart_id    (cart_id)
#  index_purchases_on_coupon_id  (coupon_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id) ON DELETE => nullify
#  fk_rails_...  (coupon_id => coupons.id)
#
class Purchase < ApplicationRecord
  has_many :purchase_products, dependent: :destroy
  belongs_to :cart
  belongs_to :coupon
  validate :cart_not_empty
  validates :lastname, presence: true, length: { maximum: 10 }
  validates :firstname, presence: true, length: { maximum: 10 }
  validates :username, length: { maximum: 20 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/, message: 'は正しいメールアドレスを入力してください' }
  validates :address1, presence: true, length: { maximum: 100 }
  validates :address2, length: { maximum: 100 }
  validates :country, presence: true, length: { maximum: 25 }
  validates :state, presence: true, length: { maximum: 25 }
  validates :zip_code, presence: true,
                       format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む7桁の数字で入力してください（例：123-4567）' }

  validates :name_on_card, presence: true, format: { with: /\A[A-Z\s]+\z/, message: 'は大文字と半角スペースのみで入力してください' }
  validates :card_number, presence: true, format: { with: /\A\d{12,19}\z/ }, length: { minimum: 12, maximum: 19 }
  validates :expiration, presence: true, format: { with: %r{\A\d{2}/\d{2}\z}, message: 'は月/年の形式（MM/YY）で入力してください' }
  validates :cvv, presence: true,
                  format: { with: /\A\d{3,4}\z/, message: 'は3桁または4桁の数字で入力してください' },
                  numericality: { only_integer: true },
                  length: { in: 3..4 }

  after_create :after_purchase_save

  def total_pay
    purchase_products.sum(&:subtotal)
  end

  private

  def after_purchase_save
    AdminMailer.create_admin_mail(self).deliver_now
    CustomerMailer.create_customer_mail(self).deliver_now
    cart.destroy

    return if coupon_id.blank?

    coupon = self.coupon
    return unless coupon

    coupon.update(is_used: true)
  end

  def cart_not_empty
    return unless purchase_products.empty?

    errors.add(:base, 'カートに商品が入っていません')
  end
end
