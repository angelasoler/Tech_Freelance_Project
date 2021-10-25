require 'rails_helper'

describe 'owner view proposals on his projects' do
  before do
    avaliador = Owner.create!({email: 'avaliador@mail.com', 
                              password: '123456'
                              })
    login_as avaliador, scope: :owner
    propositor = Freelancer.create!({email: 'propositor@mail.com', 
                                    password: '123456'
                                    })
    perfil_propositor = Profile.create!({full_name: 'Propositor Garcia', social_name: '', 
                                        birth_date: 19950608, educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: propositor
                                        })
    projecto_marketing = Project.create!({title: 'Marketing em redes sociais', 
                                          description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                          desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                          max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                          remote: true, owner: avaliador
                                          })
    proposta = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projecto_marketing, 
                                profile: perfil_propositor
                                })
  end

  it 'successfully' do
    visit my_projects_projects_path
    click_on 'Marketing em redes sociais'
    click_on 'Propositor Garcia'

    expect(page).to have_content('Sou expecialista em redes sociais com 6 anos de experiencia')
    expect(page).to have_content('Tarifa por hora: R$ 60')
    expect(page).to have_content('Horas disponiveis por semana: 10')
    expect(page).to have_content('Expectativa de praço: 6 semanas')
    expect(page).to have_link('Propositor Garcia')
    expect(page).to have_button('Aceitar')
    expect(page).to have_button('Recusar')
  end

  it 'and accept' do
    visit my_projects_projects_path
    click_on 'Marketing em redes sociais'
    click_on 'Propositor Garcia'
    click_on 'Aceitar'

    expect(page).to have_link('mande uma mensagem')
    expect(page).to have_content('Proposta Aceita!')
  end

  it 'and turn down' do
    visit my_projects_projects_path
    click_on 'Marketing em redes sociais'
    click_on 'Propositor Garcia'
    click_on 'Recusar'
    fill_in 'Porfavor escreva um feedback de porque você recusou', with: 'Não é o perfil que estamos procurando'
    click_on 'Enviar'

    expect(page).to have_current_path(feedback_path)
    expet(page).to have_content('Seu feedback foi enviado com sucesso')
  end
  
  it 'and view profile of freelancer that send proposal' do
  end
end
#[TODO]ve outros projetos que o freelancer que mandou a proposta participo