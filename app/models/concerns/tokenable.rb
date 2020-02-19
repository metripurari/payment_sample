# encoding: BINARY
module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  # protected

  def generate_token
    self.code = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      self.salt  = SecureRandom.random_bytes(64)
      self.key   = ActiveSupport::KeyGenerator.new('authcode').generate_key(salt, 32)
      crypt = ActiveSupport::MessageEncryptor.new(key)
      encrypted_token = crypt.encrypt_and_sign("#{random_token}")
      self.token = random_token
      break encrypted_token unless self.class.exists?(code: encrypted_token)
    end
  end


end
