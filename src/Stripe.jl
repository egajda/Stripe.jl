module Stripe
using DotEnv
using PyCall

function __init__()
    DotEnv.config()
    py"""
    import stripe
    import os

    def set_api(secret):
        print(secret)
        stripe.api_key = secret
    """

    py"set_api"(ENV["TEST_SECRET"])
end

"""
    PaymentIntent(amount, receipt_email; currency="usd", payment_method_types=["cards"])
"""
function PaymentIntent(
    amount, receipt_email; currency="usd", payment_method_types=["card"]
)

    py"stripe.PaymentIntent.create"(
        amount=amount,
        currency=currency,
        payment_method_types=payment_method_types,
        receipt_email=receipt_email,
    )
end

end # module
