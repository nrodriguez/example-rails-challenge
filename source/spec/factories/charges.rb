# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :charge do
    paid true
    amount 100
    currency "usd"
    refunded false

    factory :successful_charge do
      paid true
      refunded false
    end

    factory :failed_charge do
      paid false
      refunded false
    end

    factory :disputed_charge do
      paid true
      refunded true
    end
  end
end
