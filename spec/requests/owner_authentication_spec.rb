require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'not athenticated' do
    it 'can´t create project without login' do
      get new_project_path

      expect(response).to redirect_to(new_owner_session_path)
    end

    it 'can´t open new project form unless authenticated' do
      get new_project_path

      expect(response).to redirect_to(new_owner_session_path)
    end

    it 'can´t see proposals' do
      tom = Owner.create!({email: 'tom@mail.com', password: 'meu NoMe E tom'})
      marketin = Project.create!({title: 'Marketing em redes sociais', 
                                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                                desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                                max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                                remote: true, owner: tom
                                              })
      jerry = Freelancer.create!({email: 'jerry@mail.com', password: 'uma senha forte'})
      perfil_jerry = Profile.create!({full_name: 'Jerry', social_name: '', 
                      birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                      work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                      work_experience: 'veja portafolio, https://portafolio.com/ ', 
                      freelancer: jerry
                      })
      proposta_jerry_tom = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                            hourly_rate: 60, hours_per_week: 10, weeks: 6, project: marketin, 
                                            profile: perfil_jerry
                                            })
      get proposal_path(proposta_jerry_tom)

      expect(response).to redirect_to(root_path)
    end

    it 'can´t accept or turn down proposals' do
      tom = Owner.create!({email: 'tom@mail.com', password: 'meu NoMe E tom'})
      marketin = Project.create!({title: 'Marketing em redes sociais', 
                                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                                desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                                max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                                remote: true, owner: tom
                                              })
      jerry = Freelancer.create!({email: 'jerry@mail.com', password: 'uma senha forte'})
      perfil_jerry = Profile.create!({full_name: 'Jerry', social_name: '', 
                      birth_date: '19950608', educational_background: 'Publicidade na PUC', 
                      work_field: 'Midias Sociais', about_me:'Sou muito marketero', 
                      work_experience: 'veja portafolio, https://portafolio.com/ ', 
                      freelancer: jerry
                      })
      proposta_jerry_tom = Proposal.create!({motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia', 
                                            hourly_rate: 60, hours_per_week: 10, weeks: 6, project: marketin, 
                                            profile: perfil_jerry
                                          })
  
      patch proposal_path(proposta_jerry_tom)

      expect(response).to redirect_to(root_path)
    end
  end
end