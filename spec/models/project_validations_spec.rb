require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '#valid?' do
    context 'deadline for proposal' do
      it 'it`s in the past' do
        dono_de_projeto = create(:owner)
        login_as dono_de_projeto, scope: :owner
        projeto = Project.create({ title: 'Marketing em redes sociais',
                                   description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                   desire_habilities: 'Gerenciamento e marketing rede sociais',
                                   max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 1.month,
                                   remote: true, owner: dono_de_projeto })

        projeto.valid?

        expect(projeto.errors[:deadline_for_proposals]).to include('deve ser maior que dois meses.')
        expect(projeto.valid?).to eq(false)
      end

      it 'should be at least 2 months from now' do
        dono_de_projeto = create(:owner)
        projeto = Project.create({ title: 'Marketing em redes sociais',
                                   description: 'Atrair clientes atravez das nossas redes e criar promoções.',
                                   desire_habilities: 'Gerenciamento e marketing rede sociais',
                                   max_hour_payment: 60, deadline_for_proposals: Time.zone.now + 1.month,
                                   remote: true, owner: dono_de_projeto })

        projeto.valid?

        expect(projeto.errors[:deadline_for_proposals]).to include('deve ser maior que dois meses.')
        expect(projeto.valid?).to eq(false)
      end
    end
  end
end
