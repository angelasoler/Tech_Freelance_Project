FactoryBot.define do
  factory :owner do
    sequence(:email) { |n| "owner#{n}@email.com" }
    password { '123456' }
  end
end
