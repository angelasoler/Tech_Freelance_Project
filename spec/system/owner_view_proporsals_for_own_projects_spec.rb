require 'rails_helper'

describe 'owner view proposals on his projects' do
  it 'successfully' do
    avaliador = Owner.create!({email: 'avaliador@mail.com', 
                              password: '123456'
                              })
    login_as avaliador, scope: :owner
    propositor = Freelancer.create!({email: 'propositor@mail.com', 
                                    password: '123456'
                                    })
    perfil_propositor = Profile.create!({full_name: 'Propositor Garcia', social_name: '', 
                                        birth_date: 19950608, educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: propositor
                                        })
    projecto_marketing = Project.create!({title: 'Marketing em redes sociais', 
                                          description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                          desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                          max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                          remote: true, owner: avaliador
                                          })
    proposta = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projecto_marketing, 
                                profile: perfil_propositor
                                })

    visit my_projects_projects_path
    click_on 'Marketing em redes sociais'
    click_on 'Propositor Garcia'

    expect(page).to have_content('Sou expecialista em redes sociais com 6 anos de experiencia')
    expect(page).to have_content('Tarifa por hora: R$ 60')
    expect(page).to have_content('Horas disponiveis por semana: 10')
    expect(page).to have_content('Semanas para termino: 6 semanas')
    expect(page).to have_link('Propositor Garcia')
    expect(page).to have_button('Aceitar')
    expect(page).to have_button('Recusar')
  end
  
  it 'and view profile of freelancer that send proposal' do
    avaliador = Owner.create!({email: 'avaliador@mail.com', 
                              password: '123456'
                              })
    login_as avaliador, scope: :owner
    propositor = Freelancer.create!({email: 'propositor@mail.com', 
                                    password: '123456'
                                    })
    perfil_propositor = Profile.create!({full_name: 'Propositor Garcia', social_name: '', 
                                        birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ',
                                        freelancer: propositor
                                        })
    projecto_marketing = Project.create!({title: 'Marketing em redes sociais', 
                                          description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                          desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                          max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                          remote: true, owner: avaliador
                                          })
    proposta = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projecto_marketing, 
                                profile: perfil_propositor
                                })

                                visit my_projects_projects_path
                                click_on 'Marketing em redes sociais'
                                click_on 'Propositor Garcia'

    visit proposal_path(proposta)
    click_on 'Propositor Garcia'

    expect(page).to have_current_path(profile_path(perfil_propositor))
    expect(page).to have_css('h1', text: 'Propositor Garcia')
    expect(page).to have_content('Data de nascimento: 08/06/1995')
    expect(page).to have_content('Formação: Publicidade na PUC')
    expect(page).to have_content('Aréa de atuação: Midias Sociais')
    expect(page).to have_content('Sobre mim: Sou muito marketero')
    expect(page).to have_content('Experiência: veja portafolio, https://portafolio.com/')
    expect(page).not_to have_link('Candidate-se para um projeto.')
  end
  
  it 'and accept' do
    avaliador = Owner.create!({email: 'avaliador@mail.com', 
                              password: '123456'
                              })
    login_as avaliador, scope: :owner
    propositor = Freelancer.create!({email: 'propositor@mail.com', 
                                    password: '123456'
                                    })
    perfil_propositor = Profile.create!({full_name: 'Propositor Garcia', social_name: '', 
                                        birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: propositor
                                        })
    projecto_marketing = Project.create!({title: 'Marketing em redes sociais', 
                                          description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                          desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                          max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                          remote: true, owner: avaliador
                                          })
    proposta = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projecto_marketing, 
                                profile: perfil_propositor
                                })

    visit my_projects_projects_path
    click_on 'Marketing em redes sociais'
    click_on 'Propositor Garcia'
    click_on 'Aceitar'

    expect(page).to have_link('Mande uma mensagem')
    expect(page).to have_content('Proposta Aceita!')
    expect(page).not_to have_button('Aceitar')
  end

  it 'and turn down' do
    avaliador = Owner.create!({email: 'avaliador@mail.com', 
                              password: '123456'
                              })
    login_as avaliador, scope: :owner
    propositor = Freelancer.create!({email: 'propositor@mail.com', 
                                    password: '123456'
                                    })
    perfil_propositor = Profile.create!({full_name: 'Propositor Garcia', social_name: '', 
                                        birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: propositor
                                        })
    projecto_marketing = Project.create!({title: 'Marketing em redes sociais', 
                                          description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                          desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                          max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                          remote: true, owner: avaliador
                                          })
    proposta = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projecto_marketing, 
                                profile: perfil_propositor
                                })

    visit my_projects_projects_path
    click_on 'Marketing em redes sociais'
    click_on 'Propositor Garcia'
    click_on 'Recusar'
    fill_in 'Porfavor escreva um feedback de porque você recusou', with: 'Não é o perfil que estamos procurando'
    click_on 'Enviar'

    expect(page).to have_current_path('/proposals/1')
    expect(page).not_to have_link('mande uma mensagem')
    expect(page).not_to have_button('Aceitar')
    expect(page).not_to have_content('Porfavor escreva um feedback de porque você recusou')
    expect(page).to have_content('Seu feedback foi enviado com sucesso')
    expect(page).to have_content('Não é o perfil que estamos procurando')
  end

  it 'and cannot turn down without feedback' do
    avaliador = Owner.create!({email: 'avaliador@mail.com', 
                              password: '123456'
                              })
    login_as avaliador, scope: :owner
    propositor = Freelancer.create!({email: 'propositor@mail.com', 
                                    password: '123456'
                                    })
    perfil_propositor = Profile.create!({full_name: 'Propositor Garcia', social_name: '', 
                                        birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: propositor
                                        })
    projecto_marketing = Project.create!({title: 'Marketing em redes sociais', 
                                          description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                          desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                          max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                          remote: true, owner: avaliador
                                          })
    proposta = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projecto_marketing, 
                                profile: perfil_propositor
                                })

    visit my_projects_projects_path
    click_on 'Marketing em redes sociais'
    click_on 'Propositor Garcia'
    click_on 'Recusar'
    click_on 'Enviar'

    expect(page).to have_content('Porfavor escreva um feedback de porque você recusou')
    expect(page).to have_content('Deve dar um feedback para recusar')
  end
end