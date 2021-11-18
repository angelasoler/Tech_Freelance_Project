require 'rails_helper'

describe  'Visitor visits homepage' do
  it 'and view avaliable projects' do
    visitor = create(:freelancer)
    create(:profile, freelancer: visitor)
    login_as visitor, scope: :freelancer
    jeff = create(:owner)
    create(:project, title: 'Site para domicilios de comercio local',
                     description: 'Um site com fotos dos produtos, localização,
                      região de atendimento e whatsapp com mensagem
                      para fazer pedido em domicilio',
                     desire_habilities: 'desenvolvimento fullstack para comercios',
                     max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 5.months,
                     remote: true, owner: jeff)
    create(:project, title: 'Marketing em redes sociais',
                     description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                     desire_habilities: 'Gerenciamento e marketing rede sociais',
                     max_hour_payment: 70, deadline_for_proposals: Time.zone.now + 3.months,
                     remote: true, owner: jeff)

    visit root_path

    expect(page).to have_content('Site para domicilios de comercio local')
    expect(page).to have_content('Marketing em redes sociais')
    expect(page).not_to have_content('Descrição: Um site com fotos dos produtos, localização,
                                      região de atendimento e whatsapp com mensagem
                                      para fazer pedido em domicilio')
    expect(page).not_to have_content('Descrição: Atrair clientes atravez das nossas redes e criar promoções.')
    expect(page).not_to have_content('Habilidades desejadas: desenvolvimento fullstack para comercios')
    expect(page).not_to have_content('Habilidades desejadas: Gerenciamento e marketing rede sociais')
    expect(page).not_to have_content('Valor maximo por hora: R$ 60,00')
    expect(page).not_to have_content('Valor maximo por hora: R$ 70,00')
    expect(page).not_to have_content("Data limite para proposta: #{(Time.zone.now + 5.months).strftime('%d/%m/%Y')}")
    expect(page).not_to have_content("Data limite para proposta: #{(Time.zone.now + 3.months).strftime('%d/%m/%Y')}")
    expect(page).not_to have_content('Remoto: Sim')
    expect(page).not_to have_content('Presencial: Não')
  end

  it 'and view project details' do
    visitor = create(:freelancer)
    create(:profile, freelancer: visitor)
    login_as visitor, scope: :freelancer
    jeff = create(:owner)
    create(:project, title: 'Site para domicilios de comercio local',
                     description: 'Um site com fotos dos produtos, localização,
                      região de atendimento e whatsapp com mensagem
                      para fazer pedido em domicilio',
                     desire_habilities: 'desenvolvimento fullstack para comercios',
                     max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 5.months,
                     remote: true, owner: jeff)
    create(:project, title: 'Marketing em redes sociais',
                     description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                     desire_habilities: 'Gerenciamento e marketing rede sociais',
                     max_hour_payment: 70, deadline_for_proposals: Time.zone.now + 3.months,
                     remote: true, owner: jeff)

    visit root_path
    click_on 'Site para domicilios de comercio'

    expect(page).to have_content('Site para domicilios de comercio local')
    expect(page).to have_content('Descrição: Um site com fotos dos produtos, localização, região de atendimento e whatsapp com mensagem para fazer pedido em domicilio')
    expect(page).to have_content('Habilidades desejadas: desenvolvimento fullstack para comercios')
    expect(page).to have_content('Valor maximo por hora: R$ 60,00')
    expect(page).to have_content("Data limite para proposta: #{(Time.zone.now + 5.months).strftime('%d/%m/%Y')}")
    expect(page).to have_content('Remoto: Sim')
    expect(page).to have_content('Presencial: Não')
    expect(page).not_to have_content('Marketing em redes sociais')
    expect(page).not_to have_content('Descrição: Atrair clientes atravez das nossas redes e criar promoções.')
    expect(page).not_to have_content('Habilidades desejadas: Gerenciamento e marketing rede sociais')
    expect(page).not_to have_content("Data limite para proposta: #{(Time.zone.now + 3.months).strftime('%d/%m/%Y')}")
    expect(page).not_to have_content('Remoto: Não')
    expect(page).not_to have_content('Presencial: Sim')
    expect(page).not_to have_link('Enviar Proposta')
  end

  it 'and view project details and return to homepage' do
    visitor = create(:freelancer)
    create(:profile, freelancer: visitor)
    login_as visitor, scope: :freelancer
    jeff = create(:owner)
    create(:project, title: 'Site para domicilios de comercio local',
                     description: 'Um site com fotos dos produtos, localização,
                      região de atendimento e whatsapp com mensagem
                      para fazer pedido em domicilio',
                     desire_habilities: 'desenvolvimento fullstack para comercios',
                     max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 5.months,
                     remote: true, owner: jeff)
    create(:project, title: 'Marketing em redes sociais',
                     description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                     desire_habilities: 'Gerenciamento e marketing rede sociais',
                     max_hour_payment: 70, deadline_for_proposals: Time.zone.now + 3.months,
                     remote: true, owner: jeff)
    visit root_path
    click_on 'Site para domicilios de comercio'
    click_on 'Voltar'

    expect(page).to have_content('Tech Freelancers')
    expect(page).to have_link('Site para domicilios de comercio local')
    expect(page).to have_link('Marketing em redes sociais')
    expect(page).not_to have_content('Descrição: Um site com fotos dos produtos, localização,
                                      região de atendimento e whatsapp com mensagem
                                      para fazer pedido em domicilio')
    expect(page).not_to have_content('Descrição: Atrair clientes atravez das nossas redes e criar promoções.')
    expect(page).not_to have_content('Habilidades desejadas: desenvolvimento fullstack para comercios')
    expect(page).not_to have_content('Habilidades desejadas: Gerenciamento e marketing rede sociais')
    expect(page).not_to have_content('Valor maximo por hora: R$ 60,00')
    expect(page).not_to have_content('Valor maximo por hora: R$ 70,00')
    expect(page).not_to have_content("Data limite para proposta: #{(Time.zone.now + 5.months).strftime('%d/%m/%Y')}")
    expect(page).not_to have_content("Data limite para proposta: #{(Time.zone.now + 3.months).strftime('%d/%m/%Y')}")
    expect(page).not_to have_content('Remoto: Sim')
    expect(page).not_to have_content('Presencial: Não')
  end

  it 'and there is no project still' do
    visitor = create(:freelancer)
    create(:profile)
    login_as visitor, scope: :freelancer

    visit root_path

    expect(page).to have_content('Não há projetos disponiveis no momento.')
  end
end
