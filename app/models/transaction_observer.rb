class TransactionObserver < ActiveRecord::Observer

  def before_create(object)
    object.uuid = SecureRandom.urlsafe_base64(nil, false)
  end





end