require 'rails_helper'

describe 'visitor ' do
  context 'as project owner' do
    it 'logs in succesfully' do
      create(:owner, email: 'ana_paula@mail.com', password: '123456')

      visit root_path
      click_on 'Publique um projeto'
      fill_in 'Email', with: 'ana_paula@mail.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entre'

      expect(page).to have_content('Login efetuado com sucesso.')
      expect(page).to have_content('ana_paula@mail.com')
      expect(page).to have_link('Logout')
    end

    it 'logs out successfully' do
      ana_paula = create(:owner, email: 'ana_paula@mail.com', password: '123456')

      login_as ana_paula, scope: :owner

      visit root_path
      click_on 'Logout'

      expect(page).to have_content('Logout efetuado com sucesso.')
      expect(page).to have_link('Publique um projeto')
      expect(page).to have_content('Encontre profissionais de tecnologia para seus projetos!')
      expect(page).to have_content('Encontre um projeto e faça sua proposta!')
      expect(page).not_to have_content('ana_paula@mail.com')
      expect(page).not_to have_link('Logout')
    end

    it 'sign up successfully' do
      visit root_path
      click_on 'Publique um projeto'
      click_on 'Inscrever-se'
      fill_in 'Email', with: 'ana_paula@mail.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Inscrever-se'

      expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
      expect(page).to have_content('ana_paula@mail.com')
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar')
    end
  end

  context 'as freelancer' do
    it 'logs in succesfully' do
      erika = create(:freelancer, email: 'erika@mail.com', password: '123456' )

      visit root_path
      click_on 'Candidate-se para um projeto!'
      fill_in 'Email', with: 'erika@mail.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entre'

      expect(page).to have_content('Login efetuado com sucesso.')
      expect(page).to have_content('erika@mail.com')
      expect(current_path).to eq(new_profile_path)
      expect(page).to have_content('Preencha seu perfil completo para começar a criar propostas!')
      expect(page).not_to have_link('Candidate-se para um projeto!')
    end

    it 'logs out succesfully' do
      erika = create(:freelancer, email: 'erika@mail.com', password: '123456' )

      login_as erika, scope: :freelancer

      visit root_path
      click_on 'Logout'

      expect(page).to have_content('Logout efetuado com sucesso.')
      expect(page).to have_link('Candidate-se para um projeto!',
                                href: new_freelancer_session_path)
      expect(page).to have_current_path(root_path)
      expect(page).not_to have_content('erika@mail.com')
      expect(page).not_to have_link('Logout')
    end

    it 'sign in succesfully' do
      visit root_path
      click_on 'Candidate-se para um projeto'
      click_on 'Inscrever-se'
      fill_in 'Email', with: 'erika@mail.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Inscrever-se'

      expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
      expect(page).to have_content('Preencha seu perfil completo para começar a criar propostas!')
      expect(page).to have_content('erika@mail.com')
      expect(page).to have_link('Logout')
    end
  end
end
