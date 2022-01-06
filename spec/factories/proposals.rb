FactoryBot.define do
  factory :proposal do
    motivation { 'Ampla experiencia nesse tipo de projetos.' }
    hourly_rate { Random.rand(50..200) }
    hours_per_week { Random.rand(10..40) }
    weeks { Random.rand(99) }
    project
    profile
  end
end
