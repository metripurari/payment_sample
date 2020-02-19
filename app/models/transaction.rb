class Transaction < ApplicationRecord
  belongs_to :merchant
  has_one :transaction_detail, dependent: :destroy
  accepts_nested_attributes_for :transaction_detail

  alias_attribute :token, :uuid

end
