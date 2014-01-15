class UpdateSubscriptionWorker
  include Sidekiq::Worker

  def perform(options)
    customer = Stripe::Customer.retrieve(options[:customer_id])
    customer.update_subscription(plan: options[:role_name])
  end
end
