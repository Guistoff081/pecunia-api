class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :credit_card_holder_name
      t.string :credit_card_number
      t.string :description
      t.decimal :amount
      t.date :credit_card_due_date
      t.integer :credit_card_verification_value
      t.string :credit_card_holder_id_document

      t.timestamps
    end
  end
end
