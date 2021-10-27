require 'rails_helper'

describe 'freelancer views own profile' do
  context 'using menu' do
    before do
      pepito = Freelancer.create!({email: 'pepito@mail.com', 
                                  password: '123456'
                                  })
      login_as pepito, scope: :freelancer
      perfil_de_pepito = Profile.create!({full_name: 'Pepito Mendieta', social_name: '', 
                                          birth_date: 19960806, educational_background: 'Digital Design',
                                          work_field: 'Web Design', about_me: 'Sou pontual', 
                                          work_experience: '7 anos de freelance.', freelancer: pepito 
                                          })
    end
    it 'sucessfully' do
      visit root_path
      click_on 'Menu'
      click_on 'Meu perfil'

      expect(page).to have_css('h1', text: 'Pepito Mendieta')
      expect(page).to have_content('06/08/1996')
      expect(page).to have_content('Digital Design')
      expect(page).to have_content('Web Design')
      expect(page).to have_content('Sou pontual')
      expect(page).to have_content('7 anos de freelance.')
      expect(page).to have_link('Editar', href: editar_perfil_path)
      expect(page).to have_link('Menu')
    end

    it ' and edit it' do
      visit meu_perfil_path
      click_on 'Editar'
      fill_in 'Sobre mim', with: 'Tenho experiencia em projetos locais, visite www.designpossivel.com para ver meu protafolio'
      click_on 'Enviar'

      expect(page).to have_content('Editado com suscesso')
      expect(page).to have_content('Tenho experiencia em projetos locais, visite www.designpossivel.com para ver meu protafolio')
    end
  end
end