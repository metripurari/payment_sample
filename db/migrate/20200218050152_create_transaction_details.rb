class CreateTransactionDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_details do |t|
      t.string :card_no
      t.string :expiry
      t.string :card_owner
      t.references :transaction
      t.timestamps
    end
  end
end
