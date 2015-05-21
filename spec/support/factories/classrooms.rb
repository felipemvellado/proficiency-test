# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :classroom do
    student nil
    course nil
    entry_at "2015-05-21 15:42:02"
  end
end
