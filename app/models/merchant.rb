class Merchant < ApplicationRecord

  extend ExportCsv

  has_many :initial_transactions, dependent: :destroy
  has_one :token, dependent: :destroy

  def renew_token
    token.check_token_expiry
  end
end
