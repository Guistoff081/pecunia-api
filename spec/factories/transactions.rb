FactoryBot.define do
  factory :transaction do
    credit_card_holder_name { Faker::Name.name }
    credit_card_number { Faker::Finance.credit_card }
    description { Faker::Lorem.sentence }
    amount { Faker::Commerce.price(range: 0..1000.0) }
    credit_card_due_date { Faker::Business.credit_card_expiry_date }
    credit_card_verification_value { Faker::Number.number(digits: 3) }
    credit_card_holder_id_document { Faker::IDNumber.brazilian_citizen_number }
  end
end
