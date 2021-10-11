require 'rails_helper'

describe 'visitor logs in' do
  context 'as project owner' do
    it 'succesfully' do
      ana_paula = project_owner.create!(email: 'ana_paula@mail.com', 
                                        senha: '123456')
      
      visit root_path
      click_on 'Entrar'
      fill_in 'Email', with: 'ana_paula@mail.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entre'

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(ana_paula.email)
      expect(page).to have_link('Publique um projeto')
      expect(page).not_to have_link('Entrar')

    end

    it 'and logs out' do
      ana_paula = project_owner.create!(email: 'ana_paula@mail.com', 
                                        senha: '123456')

      login_as ana_paula, scope: project_owner
      
      visit root_path
      click_on 'logout'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).to have_link('Entrar')
      expect(page).to have_content('Encontre profissionais de tecnologia para seus projetos!')
      expect(page).to have_content('Encontre um projeto e faça sua proposta!')
      expect(page).to have_link('Publicar um projeto')
      expect(page).not_to have_content(ana_paula.email)
      expect(page).not_to have_link('logout')
    end

    it 'and sign in' do

      visit root_path
      click_on 'Publicar um projeto'
      click_on 'Faça o cadastro pfvr!'
      fill_in 'Email', with: 'ana_paula@mail.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirmação de senha', with: '123456'
      click_on 'Começar'

      expect(page).to have_content('Perfil cadastrado com sucesso!')
      expect(page).to have_link('Publicar um projeto')
      expect(page).to have_content(ana_paula.email)
      expect(page).to have_link('logout')
      expect(page).not_to have_link('Entrar')
    end
  end

  context 'as freelancer' do
    it 'succesfully' do
      erika = project_owner.create!(email: 'erika@mail.com', 
                                        senha: '123456')

      visit root_path
      click_on 'Entrar'
      fill_in 'Email', with: 'erika@mail.com'
      fill_in 'Senha', with: '123456'
      click_on 'Entre'

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(erika.email)
      expect(page).to have_content('Preencha seu perfil completo para começar a criar propostas!')
      expect(page).to have_link('criar propostas')
      expect(page).not_to have_link('Entre')
    end

    it 'and logs out' do
      erika = project_owner.create!(email: 'erika@mail.com', 
                                    senha: '123456')

      login_as erika, scope: project_freelancer
      visit root_path
      click_on 'logout'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).to have_link('Entrar')
      expect(page).to have_content('Encontre profissionais de tecnologia para seus projetos!')
      expect(page).to have_content('Encontre um projeto e faça sua proposta!')
      expect(page).to have_link('Candidate-se para um projeto')
      expect(page).not_to have_content(erika.email)
      expect(page).not_to have_link('logout')
    end

    it 'and sign in' do

      visit root_path
      click_on 'Candidate-se para um projeto'
      click_on 'Faça o cadastro pfvr!'
      fill_in 'Email', with: 'erika@mail.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirmação de senha', with: '123456'
      click_on 'Começar'

      expect(page).to have_content('Perfil cadastrado com sucesso!')
      expect(page).to have_content('Complete seu perfil')
      expect(page).to have_content(erika.email)
      expect(page).to have_link('logout')
      expect(page).not_to have_link('Entrar')
    end
  end
end