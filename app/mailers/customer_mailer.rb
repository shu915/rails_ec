# frozen_string_literal: true

class CustomerMailer < ApplicationMailer
  def create_customer_mail(order)
    @order = order

    mail(
      subject: 'rails_ecにて、お買い上げありがとうございます。',
      to: @order.email,
      from: 'shu915.web.creation@gmail.com'
    )
  end
end
