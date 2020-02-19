class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :description
      t.string :email
      t.boolean :status
      t.float :total_transaction_sum, default: 0

      t.timestamps
    end
  end
end
