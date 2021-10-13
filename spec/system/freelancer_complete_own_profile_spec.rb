require 'rails_helper'

describe 'freelancer complete profile'
  before do
    user = Freelancer.create!({email: 'user@mail.com', 
                                password: '123456'
                                })
    login_as user, scope: :freelancer
  end
  it 'successfully' do

    visit root_path
    click_on 'Cadidate-se para um projeto'
    fill_in 'Nome completo', with: 'Antonio Silva'
    fill_in 'Nome social', with: 'Paloma'
    fill_in 'Data de nacimento', with: 05/08/1990
    fill_in 'Formaçao', with: 'Ciencias da computação'
    select 'Desenvolvedor', from: 'Aréa de atuação'
    fill_in 'Sobre mi', with: 'Sou uma pessoa comprimetida e acredito que trabalho em equipe é uma prioridade. Projetos são como plantas, tem que regar elas todo dia'
    fill_in 'Experiência', with: 'Gerenciamento de bases de dados em Magalu por 3 anos. Visite https://meublog.com/ para ver mais do meu portafolio de backend.'
    attach_file 'image', '.image.jpg'
    click_on 'Criar'

    expect(page).to have_content('Candidate-se para um projeto.')
    expect(page).to have_link('menu')
    expect(page).to have_content(Project.all)
  end

  it 'most fill all fields'

    visit root_path
    click_on 'Cadidate-se para um projeto'
    fill_in 'Nome completo', with: ''
    fill_in 'Nome social', with: ''
    fill_in 'Data de nacimento', with: 
    fill_in 'Formaçao', with: ''
    select '', from: 'Aréa de atuação'
    fill_in 'Sobre mi', with: ''
    fill_in 'Experiência', with: ''
    attach_file '', ''
    click_on 'Criar'

    expect(freelancer.errors[:fullname]).to include('Nome completo não pode ficar em branco.')
    expect(freelancer.errors[:social_name]).to include('Nome social não pode ficar em branco.')
    expect(freelancer.errors[:birth_date]).to include('Data de nacimento não pode ficar em branco.')
    expect(freelancer.errors[:educational_background]).to include('Formaçao não pode ficar em branco.')
    expect(freelancer.errors[:work_field]).to include('Por favor selecione Aréa de atuação.')
    expect(freelancer.errors[:about_me]).to include('Sobre mi não pode ficar em branco.')
    expect(freelancer.errors[:work_experience]).to include('Experiência não pode ficar em branco.')
    expect(freelancer.errors[:photo]).to include('Deve subir uma photo.')
  end

  it 'and can access to projects details'
    marketing = Project.create!({title: 'Marketing em redes sociais', 
                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                max_hour_payment: 60, deadline_for_proposals: Time.now + 7.month, remote: true
                                })
      
    visit root_path
    click_on 'Marketing em redes sociais'
  
    expect(page).to have_link('Enviar Proposta')
    expect(page).to have_content('Mande um proposta')
    expect(page).to have_content('Valor maximo por hora 'marketing.max_hour_payment)
    expect(page).to have_content('Fecha limite para proposta 'marketing.deadline_for_proposals)
    expect(page).to have_content('Presencial: Não')
    expect(page).to have_content('Remoto: Sim')
  end     
end



# expect(page).to have_content('Complete seu perfil')
 # expect(page).to have_content('Preencha seu perfil completo para começar a criar propostas!')
      # expect(page).to have_link('criar propostas')