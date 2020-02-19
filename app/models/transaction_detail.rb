class TransactionDetail < ApplicationRecord
  belongs_to :transactionable, foreign_key: "transaction_id", class_name: "Transaction", optional: true

end
