class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(stripe_token: payment_params[:stripeToken])

    Stripe.api_key = ENV["STRIPE_SECRET_KEY"]
    charge = Stripe::Charge.create(
      :amount => 1200,
      :currency => "usd",
      :source => @payment.stripe_token,
      :metadata => {'order_id' => '6735'},
      :description => "Whatever I created for..."
    )

    @payment.stripe_charge_id = charge["id"]
    @payment.save

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.permit(:stripeToken, :stripeTokenType, :stripeEmail)
    end
end
