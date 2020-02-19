class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :code
      t.datetime :expiry
      t.binary :salt
      t.binary :key
      t.references :merchant
      t.string :token

      t.timestamps
    end
  end
end
