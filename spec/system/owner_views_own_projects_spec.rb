require 'rails_helper'

describe 'project owner views own projects' do
  context 'when has any,' do
    before do
      pedro = Owner.create!({email: 'pedro@mail.com', 
                            password:'123456'
                            })
      login_as pedro, :scope => :owner
      projeto_de_predro = Project.create!({title: 'Marketing em redes sociais', 
                                          description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                          desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                          max_hour_payment: 60, deadline_for_proposals: Time.now + 3.month, 
                                          remote: true, owner: pedro
                                          })
      outro_projeto_de_predro = Project.create!({title: 'Site para domicilios de comercio local', 
                                                description: 'Um site com fotos dos produtos, localização, 
                                                              região de atendimento e whatsapp com mensagem 
                                                              para fazer pedido em domicilio',
                                                desire_habilities: 'desenvolvimento fullstack para comercios', 
                                                max_hour_payment: 60, deadline_for_proposals: Time.now + 5.month, 
                                                remote: true, owner: pedro
                                                })
    end

    it 'using menu meus projetos' do
      visit root_path

      expect(page).to have_link('Meus Projetos', href: my_projects_projects_path)
    end

    it ' and view projects' do
    visit root_path
    click_on 'Meus Projetos'

    expect(page).to have_link('Marketing em redes sociais')
    expect(page).to have_link('Site para domicilios de comercio local')
    end
  end

  context 'and does not have any project,' do
    it 'has not register any still' do
      ana = Owner.create!({email: 'ana@mail.com', 
                            password:'123456'
                            })
      login_as ana, :scope => :owner

      visit root_path
      click_on 'Meus Projetos'

      expect(page).to have_content('Ainda não tem imoveis')
      expect(page).to have_link('Publique um projeto', href: new_project_path )
    end
  end
end