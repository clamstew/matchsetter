# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "MyString"
    address1 "MyString"
    address2 "MyString"
    state "MyString"
    city "MyString"
    zip "MyString"
  end
end
