class TransactionDetailForm < Reform::Form

  include ActiveModel::Validations

  property :card_no
  property :card_owner
  property :expiry

  validates :card_no, presence: true, length: { is: 12 }
  validates :card_owner, presence: true
  validates :expiry, presence: true
end