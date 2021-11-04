FactoryBot.define do
  factory :freelancer do
    email { generate(:email) }
    password  { "123456" }
  end
end

FactoryBot.define do
  sequence :email do |n|
    "freelancer#{n}@email.com"
  end
end