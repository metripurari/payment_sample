class TokenObserver < ActiveRecord::Observer
  def before_save(object)
    object.generate_token
    object.expiry = Time.current + 20.minutes
  end
end