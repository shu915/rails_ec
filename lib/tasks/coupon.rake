# frozen_string_literal: true

namespace :coupon do
  desc 'クーポンを10枚生成する'
  task generate: :environment do
    10.times do
      code = SecureRandom.alphanumeric(7)
      discount_amount = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000].sample

      Coupon.create(
        code:,
        discount_amount:
      )
    end
  end
end
