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

  def retrieveToken(id)
    Stripe::Token.retrieve(id)
  end

  def createToken(cardNumber, exp_month, exp_year, cvc)
    Stripe::Token.create(
        :card => {
          :number => cardNumber,
          :exp_month => exp_month,
          :exp_year => exp_year,
          :cvc => cvc
        },
    )
  end
end