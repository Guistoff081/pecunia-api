class AddUserIdToTransaction < ActiveRecord::Migration[7.1]
  def change
    add_reference :transactions, :user, null: true, foreign_key: true, type: :uuid
  end
end
