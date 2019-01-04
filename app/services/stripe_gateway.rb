class StripeGateway

  def initialize
    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
  end

  def charge(token, amount, metadata, description)
    charge = Stripe::Charge.create(
      :amount => amount,
      :currency => "usd",
      :source => token,
      :metadata => metadata,
      :description => description
    )
  end

  def refund(charge_id)
    re = Stripe::Refund.create(
      charge: charge_id
    )
  end

  def refunds()
    Stripe::Refund.list(limit: 3)
  end
end