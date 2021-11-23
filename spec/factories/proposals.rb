FactoryBot.define do
  factory :proposal do
    motivation { 'Ampla experiencia nesse tipo de projetos.' }
    hourly_rate { 200 }
    hours_per_week { 10 }
    weeks { 5 }
    project
    profile
  end
end
