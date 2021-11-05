FactoryBot.define do
  factory :owner do
    email { generate(:email) }
    password { '123456' }
  end
end

# FactoryBot.define do
#   sequence :email do |n|
#     "owner#{n}@email.com"
#   end
# end
### actoryBot::DuplicateDefinitionError: Sequence already registered: email
