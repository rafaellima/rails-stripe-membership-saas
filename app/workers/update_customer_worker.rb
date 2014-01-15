class UpdateCustomerWorker
  include Sidekiq::Worker

  def perform(user_id, stripe_token)
    user = User.find user_id
    customer = Stripe::Customer.retrieve(customer_id)

      if stripe_token.present?
        customer.card = stripe_token
      end
      customer.email = email
      customer.description = name
      customer.save
  end
end
