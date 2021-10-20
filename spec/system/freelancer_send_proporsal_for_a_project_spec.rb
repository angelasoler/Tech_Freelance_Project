require 'rails_helper'

describe 'freelancer send proposal' do
  before do
    propositor = Freelancer.create!({email: 'propositor@mail.com', 
                                    password: '123456'
                                    })
    login_as propositor, scope: :freelancer
    project_owner = Owner.create!({email: 'user_owner@mail.com', 
                                  password: '123456'
                                  })
    marketing = Project.create!({title: 'Marketing em redes sociais', 
                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                remote: true, owner: project_owner
                                })
  end

  it 'successfully' do
    visit root_path
    click_on 'Marketing em redes sociais'
    # click_on 'Enviar Proposta'
    fill_in 'Conte porque está aplicando para o projeto', with: 'Sou expecialista em redes sociais com 6 anos de experiencia'
    fill_in 'Valor hora', with: 60
    fill_in 'Horas diponiveis por semana', with: 10
    fill_in 'Semanas para termino', with: 6
    click_on 'Enviar'

    expect(page).to have_content('Sua proposta foi enviada para ser avaliada pelo dono do projeto!')
  end

  it 'and it is accepted' do


  end

  it '' do
      
  end    
end
