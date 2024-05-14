# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  def create_admin_mail(order)
    @order = order

    mail(
      subject: 'rails_ecにて、注文を承りました。',
      to: 'shu915.web.creation@gmail.com',
      from: 'shu915.web.creation@gmail.com'
    )
  end
end
