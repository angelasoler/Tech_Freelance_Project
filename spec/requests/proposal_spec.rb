require 'rails_helper'

RSpec.describe 'accept and truned down actions,', type: :request do
  describe 'authorization' do
    context 'accept buttom' do
      it 'does not go to feedback view' do
        dono_de_projeto = Owner.create!({email: 'elmeromero@mail.com', password: 'El Mero'})
        projeto = Project.create!({title: 'Marketing em redes sociais', 
                                  description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                  desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                  max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                  remote: true, owner: dono_de_projeto
                                  })
        dono_da_proposta = Freelancer.create!({email: 'jerry@mail.com', password: 'uma senha forte'})
        perfil_jerry = Profile.create!({full_name: 'Jerry', social_name: '', 
                                        birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: dono_da_proposta
                                        })
        proposta_jerry = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                          hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projeto, 
                                          profile: perfil_jerry
                                          })
        outro_owner = Owner.create!({email: 'ovacilao@mail.com', password: 'O vacilão'})
        login_as outro_owner, scope: :owner
        

        patch accept_proposals_path(proposta_jerry)

        expect(response).not_to redirect_to(edit_proposal_path(proposta_jerry))
      end

      it 'user most be authorized as owner' do
        dono_de_projeto = Owner.create!({email: 'elmeromero@mail.com', password: 'El Mero'})
        projeto = Project.create!({title: 'Marketing em redes sociais', 
                                  description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                  desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                  max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                  remote: true, owner: dono_de_projeto
                                  })
        dono_da_proposta = Freelancer.create!({email: 'jerry@mail.com', password: 'uma senha forte'})
        perfil_jerry = Profile.create!({full_name: 'Jerry', social_name: '', 
                                        birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: dono_da_proposta
                                      })
        proposta_jerry = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                          hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projeto, 
                                          profile: perfil_jerry
                                          })
        outro_owner = Owner.create!({email: 'ovacilao@mail.com', password: 'O vacilão'})
        login_as outro_owner, scope: :owner

        patch accept_proposals_path(proposta_jerry)

        expect(response).to have_http_status(401)
      end
    end

    context 'turn down buttom' do
      it 'does not go to feedback view' do
        dono_de_projeto = Owner.create!({email: 'elmeromero@mail.com', password: 'El Mero'})
        projeto = Project.create!({title: 'Marketing em redes sociais', 
                                                  description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                                  desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                                  max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                                  remote: true, owner: dono_de_projeto
                                                })
        dono_da_proposta = Freelancer.create!({email: 'jerry@mail.com', password: 'uma senha forte'})
        perfil_jerry = Profile.create!({full_name: 'Jerry', social_name: '', 
                                        birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: dono_da_proposta
                                        })
        proposta_jerry = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                          hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projeto, 
                                          profile: perfil_jerry
                                          })
        outro_owner = Owner.create!({email: 'ovacilao@mail.com', password: 'O vacilão'})
        login_as outro_owner, scope: :owner

        get proposal_path(proposta_jerry)
        patch turn_down_proposals_path(proposta_jerry)

        expect(response).not_to redirect_to(edit_proposal_path(proposta_jerry))
      end

      it 'user most be authorized as owner' do
        dono_de_projeto = Owner.create!({email: 'elmeromero@mail.com', password: 'El Mero'})
        projeto = Project.create!({title: 'Marketing em redes sociais', 
                                                  description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                                  desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                                  max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                                  remote: true, owner: dono_de_projeto
                                                })
        dono_da_proposta = Freelancer.create!({email: 'jerry@mail.com', password: 'uma senha forte'})
        perfil_jerry = Profile.create!({full_name: 'Jerry', social_name: '', 
                                        birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                                        work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                                        work_experience: 'veja portafolio, https://portafolio.com/ ', 
                                        freelancer: dono_da_proposta
                                        })
        proposta_jerry = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                          hourly_rate: 60, hours_per_week: 10, weeks: 6, project: projeto, 
                                          profile: perfil_jerry
                                          })
        outro_owner = Owner.create!({email: 'ovacilao@mail.com', password: 'O vacilão'})
        login_as outro_owner, scope: :owner

        patch turn_down_proposals_path(proposta_jerry)

        expect(response).to have_http_status(401)
      end
    end
  end
end