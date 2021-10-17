require 'rails_helper'

describe  'Visitor visits homepage' do
  it 'and view avaliable projects' do
    jeff = Owner.create!(email: 'jeff@mail.com', password: '123456')
    web_site = Project.create!({title: 'Site para domicilios de comercio local', 
                              description: 'Um site com fotos dos produtos, localização, 
                                            região de atendimento e whatsapp com mensagem 
                                            para fazer pedido em domicilio',
                              desire_habilities: 'desenvolvimento fullstack para comercios', 
                              max_hour_payment: 60, deadline_for_proposals: Time.now + 5.month, 
                              remote: true, owner: jeff
                              })
    marketing = Project.create!({title: 'Marketing em redes sociais', 
                              description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                              desire_habilities: 'Gerenciamento e marketing rede sociais', 
                              max_hour_payment: 60, deadline_for_proposals: Time.now + 3.month, 
                              remote: true, owner: jeff
                              })

    visit root_path

    
    expect(page).to have_content(web_site.title)
    expect(page).to have_content(marketing.title)
    expect(page).not_to have_content(web_site.description)
    expect(page).not_to have_content(marketing.description)
    expect(page).not_to have_content('Habilidades desejadas:')
    expect(page).not_to have_content(web_site.desire_habilities)
    expect(page).not_to have_content(marketing.desire_habilities)
  end

  it 'and view project details' do
    jeff = Owner.create!(email: 'jeff@mail.com', password: '123456')
    web_site = Project.create!({title: 'Site para domicilios de comercio', 
                              description: 'Um site com fotos dos produtos, localização, região de atendimento e whatsapp com mensagem para fazer pedido em domicilio',
                              desire_habilities: 'desenvolvimento fullstack para comercios', 
                              max_hour_payment: 60, deadline_for_proposals: Time.now + 6.month, 
                              remote: true, owner: jeff
                              })
                              marketing = Project.create!({title: 'Marketing em redes sociais', 
                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                max_hour_payment: 60, deadline_for_proposals: Time.now + 4.month, 
                                remote: true, owner: jeff
                                })
                              
  visit root_path
  click_on 'Site para domicilios de comercio'
  
  expect(page).to have_content(web_site.title)
  expect(page).to have_content(web_site.description)
  expect(page).to have_content('Habilidades desejadas:')
  expect(page).to have_content(web_site.desire_habilities)
  expect(page).not_to have_content(marketing.title)
  expect(page).not_to have_content(marketing.description)
  expect(page).not_to have_content(marketing.desire_habilities)
  expect(page).not_to have_link('Enviar Proposta')
end
                              
  it 'and view project details and return to homepage' do
    jeff = Owner.create!(email: 'jeff@mail.com', password: '123456')
    web_site = Project.create!({title: 'Site para domicilios de comercio', 
                                  description: 'Um site com fotos dos produtos, localização, 
                                  região de atendimento e whatsapp com mensagem 
                                  para fazer pedido em domicilio',
                                  desire_habilities: 'desenvolvimento fullstack para comercios', 
                                  max_hour_payment: 60, deadline_for_proposals: Time.now + 3.month, 
                                  remote: true, owner: jeff
                                  })
    marketing = Project.create!({title: 'Marketing em redes sociais', 
                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                max_hour_payment: 60, deadline_for_proposals: Time.now + 7.month, 
                                remote: true, owner: jeff
                                })
                                
                                visit root_path
                                click_on 'Site para domicilios de comercio'
    click_on 'Voltar'

    expect(page).to have_content('Tech Freelancers')
    expect(page).to have_content('Marketing em redes sociais')
    expect(page).to have_content(web_site.title)
    expect(page).to have_content(marketing.title)
    expect(page).not_to have_content('Habilidades desejadas:')
    expect(page).not_to have_content(web_site.description)
    expect(page).not_to have_content(web_site.desire_habilities)
    expect(page).not_to have_content(marketing.description)
    expect(page).not_to have_content(marketing.desire_habilities)
  end
  
  it 'and there is no project still' do
  
    visit root_path
  
    expect(page).to have_content('Não há projetos disponiveis no momento.')
  end
end
