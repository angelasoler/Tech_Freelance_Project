require 'rails_helper'

describe 'project owner views own projects' do
  it 'using link meus projetos' do
    pedro = create(:owner, email: 'pedro@mail.com', password: '123456')
    login_as pedro, scope: :owner
    projeto_de_predro = create(:project, title: 'Marketing em redes sociais',
                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                desire_habilities: 'Gerenciamento e marketing rede sociais',
                                max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 3.months,
                                remote: true, owner: pedro)
    outro_projeto_de_predro = create(:project, title: 'Site para domicilios de comercio local',
                                      description: 'Um site com fotos dos produtos, localização,
                                                  região de atendimento e whatsapp com mensagem
                                                  para fazer pedido em domicilio',
                                      desire_habilities: 'desenvolvimento fullstack para comercios',
                                      max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 5.months,
                                      remote: true, owner: pedro)
    jason = create(:owner, email: 'jason@mail.com', password: '123456')
    projeto_de_jason = create(:project, title: 'Desenvolvimento web',
                              description: 'Applição web para vendas',
                              desire_habilities: 'Experiencia com ecommerce',
                              max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 3.months,
                              remote: true, owner: jason)
    outro_projeto_de_jason = create(:project, title: 'Back-end de sistema de vendas',
                                    description: 'manutencion em sistema feito com cobol',
                                    desire_habilities: 'experiencias previas similares',
                                    max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 5.months,
                                    remote: true, owner: jason)

    visit root_path
    click_on 'Meus Projetos'

    expect(current_path).to eq(my_projects_projects_path)
    expect(page).to have_link('Marketing em redes sociais')
    expect(page).to have_link('Site para domicilios de comercio local')
    expect(page).not_to have_link('Desenvolvimento web')
    expect(page).not_to have_link('Back-end de sistema de vendas')
    expect(page).not_to have_content('Gerenciamento e marketing rede sociais')
    expect(page).not_to have_content('Remoto: sim')
    expect(page).not_to have_content('Atrair clientes atravez das nossas redes e criar promoções.')
    expect(page).not_to have_content('Um site com fotos dos produtos, localização,
                                      região de atendimento e whatsapp com mensagem
                                      para fazer pedido em domicilio')
    expect(page).not_to have_content('experiencias previas similares')
  end

  it 'and view a project' do
    pedro = create(:owner, email: 'pedro@mail.com', password: '123456')
    login_as pedro, scope: :owner
    projeto_de_predro = create(:project, title: 'Marketing em redes sociais',
                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                desire_habilities: 'Gerenciamento e marketing rede sociais',
                                max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 3.months,
                                remote: true, owner: pedro)
    outro_projeto_de_predro = create(:project, title: 'Site para domicilios de comercio local',
                                      description: 'Um site com fotos dos produtos, localização,
                                                  região de atendimento e whatsapp com mensagem
                                                  para fazer pedido em domicilio',
                                      desire_habilities: 'desenvolvimento fullstack para comercios',
                                      max_hour_payment: 70, deadline_for_proposals: Time.zone.now + 5.months,
                                      face_to_face: true, owner: pedro)
    data = Time.zone.now + 3.months

    visit my_projects_projects_path
    click_on 'Marketing em redes sociais'

    expect(page).to have_css('h1', text: 'Marketing em redes sociais')
    expect(page).to have_content('Descrição: Atrair clientes atravez das nossas redes e criar promoções.')
    expect(page).to have_content('Habilidades desejadas: Gerenciamento e marketing rede sociais')
    expect(page).to have_content('Valor maximo por hora: R$ 60')
    expect(page).to have_content("Data limite para proposta: #{data.strftime('%d/%m/%Y')}")
    expect(page).to have_content('Remoto: Sim')
    expect(page).to have_content('Presencial: Não')
    expect(page).not_to have_link('Marketing em redes sociais')
    expect(page).not_to have_link('Site para domicilios de comercio local')
    expect(page).not_to have_content('Descrição: Um site com fotos dos produtos, localização,
                                      região de atendimento e whatsapp com mensagem
                                      para fazer pedido em domicilio')
    expect(page).not_to have_content('Habilidades desejadas: desenvolvimento fullstack para comercios')
    expect(page).not_to have_content('Valor maximo por hora: R$ 70')
    expect(page).not_to have_content("Data limite para proposta: #{(data + 2.months).strftime('%d/%m/%Y')}")
    expect(page).not_to have_content('Remoto: Não')
    expect(page).not_to have_content('Presencial: Sim')
  end

  it 'has not register any still' do
    jason = create(:owner)
    projeto_de_jason = create(:project, title: 'Desenvolvimento web',
                              owner: jason)
    outro_projeto_de_jason = create(:project, title: 'Back-end de sistema de vendas',
                                    remote: true, owner: jason)
    pedro = create(:owner)
    projeto_de_predro = create(:project, title: 'Marketing em redes sociais',
                                owner: pedro)
    outro_projeto_de_predro = create(:project, title: 'Site para domicilios de comercio local',
                                      owner: pedro)
    ana = create(:owner)
    login_as ana, scope: :owner

    visit root_path
    click_on 'Meus Projetos'

    expect(page).to have_content('Ainda não tem projetos')
    expect(page).to have_link('Publique um projeto', href: new_project_path)
    expect(page).not_to have_link('Desenvolvimento web')
    expect(page).not_to have_link('Back-end de sistema de vendas')
    expect(page).not_to have_link('Marketing em redes sociais')
    expect(page).not_to have_link('Site para domicilios de comercio local')
  end
end
