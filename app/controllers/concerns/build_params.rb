module BuildParams

  def make_params(params, merchant)
    t = Transaction.new
    t.build_transaction_detail
    tf = TransactionForm.new(t)
    transaction = params.delete("transaction")
    transaction.permit!
    valid = tf.validate(transaction)
    Transaction::Create.(params: transaction.merge(status: valid), current_merchant: merchant)
  end
end