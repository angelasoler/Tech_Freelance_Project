require 'rails_helper'

describe 'freelancer complete profile' do
  it 'successfully' do
    user = create(:freelancer)
    login_as user, scope: :freelancer

    visit root_path
    click_on 'Candidate-se para um projeto!'
    fill_in 'Nome completo', with: 'Antonio Silva'
    fill_in 'Nome social', with: 'Paloma'
    fill_in 'Data de nascimento', with: 19_900_508
    fill_in 'Formação', with: 'Ciencias da computação'
    select 'Dev', from: 'Aréa de atuação'
    fill_in 'Sobre mim',
            with: 'Sou uma pessoa comprometida. Projetos são como plantas.'
    fill_in 'Experiência',
            with: 'Visite https://meublog.com/ para ver mais do meu portafolio de backend.'
    attach_file('Foto', Rails.root.join('spec/support/assets/image.jpg'))
    click_on 'Completar Perfil'

    expect(page).to have_link('Candidate-se para um projeto.')
    expect(page).not_to have_css('h1', text: 'Antonio Silva')
    expect(page).to have_css('h1', text: 'Paloma')
    expect(page).to have_content('Data de nascimento: 08/05/1990')
    expect(page).to have_content('Formação: Ciencias da computação')
    expect(page).to have_content('Aréa de atuação: Dev')
    expect(page).to have_content('Sobre mim: Sou uma pessoa comprometida. Projetos são como plantas')
    expect(page).to have_content('Visite https://meublog.com/ para ver mais do meu portafolio de backend.')
    expect(page).to have_css("img[src*='image.jpg']")
  end

  it 'most fill all fields' do
    user = create(:freelancer)
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
    user = create(:freelancer)
    create(:profile, freelancer: user)
    login_as user, scope: :freelancer
    create(:project, title: 'Marketing em redes sociais',
                     description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                     desire_habilities: 'Gerenciamento e marketing rede sociais',
                     max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 2.months,
                     remote: true)

    visit root_path
    click_on 'Marketing em redes sociais'

    expect(page).to have_content('Marketing em redes sociais')
    expect(page).to have_content('Descrição: Atrair clientes atravez das nossas redes e criar promoções.')
    expect(page).to have_content('Valor maximo por hora: R$ 60')
    expect(page).to have_content("Data limite para proposta: #{(Time.zone.now + 2.months).strftime('%d/%m/%Y')}")
    expect(page).to have_content('Presencial: Não')
    expect(page).to have_content('Remoto: Sim')
    expect(page).to have_content('Mande uma proposta para esse projeto!')
  end

  it 'and can login successfully' do
    user = create(:freelancer, email: 'user@mail.com', password: '123456')
    create(:profile, freelancer: user)

    visit new_freelancer_session_path
    fill_in 'Email', with: 'user@mail.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entre'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Procure um projeto para se candidatar')
    expect(page).to have_content('Login efetuado com sucesso.')
  end
end
