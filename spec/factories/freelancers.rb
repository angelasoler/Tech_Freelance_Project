FactoryBot.define do
  factory :freelancer do
    sequence(:email) { |n| "freelancer#{n}@email.com" }
    password { '123456' }
  end
end
