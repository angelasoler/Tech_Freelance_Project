FactoryBot.define do
  factory :owner do
    email { generate(:email) }
    password { '123456' }
  end
end
