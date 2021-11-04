FactoryBot.define do
  factory :profile do
    full_name { "Jhon Smith" }
    social_name { '' }
    birth_date { '03/08/2001' }
    educational_background { 'Ingenheiro' }
    work_field { 'Dev' }
    about_me { 'Já passei por tudos os roles dentro da metodologia agil mas sou dev.' }
    work_experience { 'Visite meu portafolio em https://protafoliodev.com' }
    freelancer
  end
end