FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "tom#{n}@example.com"}
    provider 'email'
    password '12345678'
  end
end