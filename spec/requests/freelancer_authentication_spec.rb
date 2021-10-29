require 'rails_helper'

describe 'freelancer authentication:' do
  context 'unauthenticated visitor can`t' do
    it 'open new profile form' do
      project_owner = Owner.create!({email: 'user_owner@mail.com', 
                                    password: '123456'
                                    })
      marketing = Project.create!({title: 'Marketing em redes sociais', 
                                  description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                  desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                  max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                  remote: true, owner: project_owner
                                  })

      get new_profile_path

      expect(response).to redirect_to(new_freelancer_session_path)
    end
  end

  context 'without complete profile' do
    it 'can´t send a proposal' do
      project_owner = Owner.create!({email: 'user_owner@mail.com', 
                                    password: '123456'
                                    })
      marketing = Project.create!({title: 'Marketing em redes sociais', 
                                  description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                  desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                  max_hour_payment: 60, deadline_for_proposals: Time.now + 2.month, 
                                  remote: true, owner: project_owner
                                  })
      angela = Freelancer.create!(email: 'angela@mail.com', password: '123456')
      login_as angela, scope: :freelancer

      get '/projects/1'

      expect(response).to redirect_to(new_profile_path)
    end
  end
end