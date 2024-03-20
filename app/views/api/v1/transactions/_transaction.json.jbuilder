json.extract! transaction, :id, :credit_card_holder_name, :credit_card_number, :description, :amount, :credit_card_due_date, :credit_card_verification_value, :credit_card_holder_id_document,
:created_at, :updated_at
json.url api_v1_transaction_url(transaction, format: :json)
