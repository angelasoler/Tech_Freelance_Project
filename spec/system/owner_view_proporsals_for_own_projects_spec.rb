require 'rails_helper'

describe 'owner view proposals for projects' do
  context 'that owns' do
    it 'successfully' do
      avaliador = create(:owner)
      login_as avaliador, scope: :owner
      perfil_propositor = create(:profile, full_name: 'Propositor Garcia')
      projeto = create(:project, title: 'Marketing em redes sociais',
                                 owner: avaliador)
      create(:proposal, motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia',
                        hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projeto,
                        profile: perfil_propositor)

      visit my_projects_projects_path
      click_on 'Marketing em redes sociais'
      click_on 'Propositor Garcia'

      expect(page).to have_content('Sou expecialista em redes sociais com 6 anos de experiencia')
      expect(page).to have_content('Tarifa por hora: R$ 60')
      expect(page).to have_content('Horas disponiveis por semana: 10')
      expect(page).to have_content('Semanas para termino: 6 semanas')
      expect(page).to have_content('Valor total da proposta: R$ 3.600')
      expect(page).to have_link('Propositor Garcia')
      expect(page).to have_button('Aceitar')
      expect(page).to have_button('Recusar')
    end

    it 'and view profile of freelancer that send proposal' do
      avaliador = create(:owner)
      login_as avaliador, scope: :owner
      perfil_propositor = create(:profile, full_name: 'Propositor Garcia', social_name: '',
                                           birth_date: '19950608', educational_background: 'Publicidade na PUC',
                                           work_field: 'Midias Sociais', about_me: 'Sou muito marketero',
                                           work_experience: 'veja portafolio, https://portafolio.com/ ')
      projeto = create(:project, title: 'Marketing em redes sociais',
                                 owner: avaliador)
      create(:proposal, project: projeto,
                        profile: perfil_propositor)

      visit my_projects_projects_path
      click_on 'Marketing em redes sociais'
      click_on 'Propositor Garcia'
      click_on 'Propositor Garcia'

      expect(page).to have_current_path(profile_path(perfil_propositor))
      expect(page).to have_css('h1', text: 'Propositor Garcia')
      expect(page).to have_content('Data de nascimento: 08/06/1995')
      expect(page).to have_content('Forma????o: Publicidade na PUC')
      expect(page).to have_content('Ar??a de atua????o: Midias Sociais')
      expect(page).to have_content('Sobre mim: Sou muito marketero')
      expect(page).to have_content('Experi??ncia: veja portafolio, https://portafolio.com/')
      expect(page).not_to have_link('Candidate-se para um projeto.')
    end

    it 'and accept' do
      avaliador = create(:owner)
      login_as avaliador, scope: :owner
      perfil_propositor = create(:profile)
      projeto = create(:project, owner: avaliador)
      create(:proposal, project: projeto,
                        profile: perfil_propositor)

      visit my_projects_projects_path
      click_on projeto.title
      click_on perfil_propositor.full_name
      click_on 'Aceitar'

      expect(page).to have_link('Mande uma mensagem')
      expect(page).to have_content('Proposta Aceita!')
      expect(page).not_to have_button('Aceitar')
      expect(page).not_to have_content('Feed back n??o pode ficar em branco')
    end

    it 'and turn down' do
      avaliador = create(:owner)
      login_as avaliador, scope: :owner
      perfil_propositor = create(:profile)
      projeto = create(:project, owner: avaliador)
      create(:proposal, project: projeto,
                        profile: perfil_propositor)

      visit my_projects_projects_path
      click_on projeto.title
      click_on perfil_propositor.full_name
      click_on 'Recusar'
      fill_in 'Porfavor escreva um feedback de porque voc?? recusou',
              with: 'N??o ?? o perfil que estamos procurando'
      click_on 'Enviar'

      expect(page).to have_current_path('/proposals/1')
      expect(page).not_to have_link('mande uma mensagem')
      expect(page).not_to have_button('Aceitar')
      expect(page).not_to have_content('Porfavor escreva um feedback de porque voc?? recusou')
      expect(page).to have_content('Seu feedback foi enviado com sucesso')
      expect(page).to have_content('N??o ?? o perfil que estamos procurando')
    end

    it 'and cannot turn down without feedback' do
      avaliador = create(:owner)
      login_as avaliador, scope: :owner
      perfil_propositor = create(:profile)
      projeto = create(:project, owner: avaliador)
      create(:proposal, project: projeto,
                        profile: perfil_propositor)

      visit my_projects_projects_path
      click_on projeto.title
      click_on perfil_propositor.full_name
      click_on 'Recusar'
      click_on 'Enviar'

      expect(page).to have_content('Porfavor escreva um feedback de porque voc?? recusou')
      expect(page).to have_content('Deve dar um feedback para recusar')
    end
  end

  context 'that does not own' do
    it 'and cannot see it' do
      dono_de_projeto = create(:owner)
      create(:project, owner: dono_de_projeto)
      proposta_jerry = create(:proposal)
      outro_owner = create(:owner)
      login_as outro_owner, scope: :owner

      visit proposal_path(proposta_jerry)

      expect(current_path).not_to eq(proposal_path(proposta_jerry))
      expect(current_path).to eq(root_path)
    end
  end
end
