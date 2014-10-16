# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    sequence(:first_name) { |n| "Customer_#{n}" }
    sequence(:last_name) { |n| "Dude_#{n}" }
  end
end
