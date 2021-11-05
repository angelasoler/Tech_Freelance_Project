FactoryBot.define do
  factory :project do
    title { 'Gerenciamento de ecommerce' }
    description { 'gerenciar stocks, fotos e vendas' }
    desire_habilities { 'Back-end dev' }
    max_hour_payment { 80 }
    deadline_for_proposals { Time.now + 2.months }
    face_to_face { false }
    remote { true }
    owner
  end
end
