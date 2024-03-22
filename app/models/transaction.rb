class Transaction < ApplicationRecord
  belongs_to :user
  validates :credit_card_holder_name, :credit_card_number, :description, :credit_card_holder_id_document, presence: true
end
