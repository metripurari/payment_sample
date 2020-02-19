class Token < ApplicationRecord

  belongs_to :merchant
  include Tokenable

  default_scope -> { select(:id, :code, :expiry, :merchant_id) }

  def expired?
    return !(expiry && expiry >  Time.current)
  end

  def check_token_expiry
    return self unless self.expired?
    self.generate_token
    self.expiry = Time.current + 20.minutes
    self.save
    self
  end
end
