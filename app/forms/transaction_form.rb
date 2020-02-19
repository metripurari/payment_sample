class TransactionForm < Reform::Form
  include ActiveModel::Validations

  property :amount
  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  property :transaction_detail, form: TransactionDetailForm
end