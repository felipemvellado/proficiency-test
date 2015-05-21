# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    name "John"
    register_number "Doe"
    status 1
  end
end
