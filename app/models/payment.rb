class Payment < ApplicationRecord

  def refundable?
    return nil if refunded?

    stripe_charge_id.present?
  end

  def refunded?
    refund_id.present?
  end
end
