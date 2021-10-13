require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'valid?' do
    before do 
      dono_de_projeto = Owner.create!({email: 'projeto@mail.com', password: '123456'})
      login_as dono_de_projeto, scope: :owner
    end
    context 'deadline for proposal' do
      it 'should be at least 2 months from now'
        projeto = Project.create!({title: 'Marketing em redes sociais', 
                                  description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                  desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                  max_hour_payment: 60, deadline_for_proposals: Time.now + 1.month, remote: true
                                  })
        
        projeto.valid?

        expect(project.errors[:deadline_for_proposals]).to include('deve ser maior que dois meses.')
        expect(projeto.valid?).to eq false
      end

      it 'it`s in the past' do
        projeto = Project.create!({title: 'Marketing em redes sociais', 
                                  description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                  desire_habilities: 'Gerenciamento e marketing rede sociais', 
                                  max_hour_payment: 60, deadline_for_proposals: Time.now - 1.month, remote: true
                                  })

        projeto.valid?

        expect(project.errors[:deadline_for_proposals]).to include('deve ser maior que dois meses.')
        expect(projeto.valid?).to eq false
      end
    end
  end
end
