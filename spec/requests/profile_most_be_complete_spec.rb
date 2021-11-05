require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Freelance most complete profile' do
    it 'to see project details' do
      tom = Owner.create!({ email: 'tom@mail.com', password: 'meu NoMe E tom' })
      projeto_marketing_tom = Project.create!({ title: 'Marketing em redes sociais',
                                                description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                                desire_habilities: 'Gerenciamento e marketing rede sociais',
                                                max_hour_payment: 60, deadline_for_proposals: Time.now + 2.months,
                                                remote: true, owner: tom })
      jerry = Freelancer.create!({ email: 'jerry@mail.com',
                                   password: 'uma senha forte' })
      login_as jerry, scope: :freelancer

      get project_path(projeto_marketing_tom.id)

      expect(response).to redirect_to(new_profile_path)
    end
  end
end
