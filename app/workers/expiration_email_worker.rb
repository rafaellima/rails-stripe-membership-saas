class ExpirationEmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find user_id
    UserMailer.expire_mail(user).deliver
  end
end
