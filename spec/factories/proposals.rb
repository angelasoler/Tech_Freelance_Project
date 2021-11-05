FactoryBot.define do
  factory :proposal do
    motivation { "Apartamento com churrasqueira" }
    hourly_rate { 200 }
    hours_per_week { 10 }
    weeks { 5 }
    project
    profile
    owner
  end
end