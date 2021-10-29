require 'rails_helper'

describe 'freelancer complete profile' do
  it 'successfully' do
    user = Freelancer.create!({email: 'user@mail.com', 
                                password: '123456'
                              })
    login_as user, scope: :freelancer
    user_owner = Owner.create!({email: 'user_owner@mail.com', 
                                password: '123456'
                                })
    marketing = Project.create!({title: 'Marketing em redes sociais', 
                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                remote: true, owner: user_owner
                                })

    visit root_path
    click_on 'Candidate-se para um projeto!'
    fill_in 'Nome completo', with: 'Antonio Silva'
    fill_in 'Nome social', with: 'Paloma'
    fill_in 'Data de nascimento', with: 19900508
    fill_in 'Formação', with: 'Ciencias da computação'
    select 'Dev', from: 'Aréa de atuação' 
    fill_in 'Sobre mim', with: 'Sou uma pessoa comprometida e acredito que trabalho em equipe é uma prioridade. Projetos são como plantas, tem que regar elas todo dia'
    fill_in 'Experiência', with: 'Gerenciamento de bases de dados em Magalu por 3 anos. Visite https://meublog.com/ para ver mais do meu portafolio de backend.'
    attach_file('Foto', Rails.root + 'app/assets/images/image.jpg')
    click_on 'Completar Perfil'

    expect(page).to have_link('Candidate-se para um projeto.')
    expect(page).not_to have_css('h1', text: 'Antonio Silva')
    expect(page).to have_css('h1', text: 'Paloma')
    expect(page).to have_content('Data de nascimento: 08/05/1990')
    expect(page).to have_content('Formação: Ciencias da computação')
    expect(page).to have_content('Aréa de atuação: Dev')
    expect(page).to have_content('Sobre mim: Sou uma pessoa comprometida e acredito que trabalho em equipe é uma prioridade. Projetos são como plantas, tem que regar elas todo dia')
    expect(page).to have_content('Experiência: Gerenciamento de bases de dados em Magalu por 3 anos. Visite https://meublog.com/ para ver mais do meu portafolio de backend.')
    expect(page.has_xpath?('app/assets/images/image.jpg'))
  end

  it 'most fill all fields' do
    user = Freelancer.create!({email: 'user@mail.com', 
                                password: '123456'
                              })
    login_as user, scope: :freelancer

    visit new_profile_path
    click_on 'Completar Perfil'

    expect(page).to have_content('Nome completo não pode ficar em branco')
    expect(page).to have_content('Data de nascimento não pode ficar em branco')
    expect(page).to have_content('Formação não pode ficar em branco')
    expect(page).to have_content('Aréa de atuação não pode ficar em branco')
    expect(page).to have_content('Sobre mim não pode ficar em branco')
    expect(page).to have_content('Experiência não pode ficar em branco')\
  end

  it 'and can access to projects details' do
    user = Freelancer.create!({email: 'user@mail.com', 
                                password: '123456'
                              })
    Profile.create!({full_name: 'João', social_name: '', 
                    birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                    work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                    work_experience: 'veja portafolio, https://portafolio.com/ ', 
                    freelancer: user
                    })
    login_as user, scope: :freelancer
    user_owner = Owner.create!({email: 'user_owner@mail.com', 
                                password: '123456'
                                })
    marketing = Project.create!({title: 'Marketing em redes sociais', 
                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                remote: true, owner: user_owner
                                })

    visit root_path
    click_on 'Marketing em redes sociais'
  
    expect(page).to have_content('Valor maximo por hora: R$ 60')
    expect(page).to have_content('Data limite para proposta:')
    expect(page).to have_content('Presencial: Não')
    expect(page).to have_content('Remoto: Sim')
    expect(page).to have_content('Mande uma proposta para esse projeto!')
  end    
end