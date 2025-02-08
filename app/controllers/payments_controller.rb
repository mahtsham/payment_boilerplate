class PaymentsController < ApplicationController
  require 'stripe'

  def new
  end

  def create
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: { name: 'Example Product' },
          unit_amount: 1000
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: success_payments_url,
      cancel_url: cancel_payments_url
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
  end

  def cancel
  end
end
