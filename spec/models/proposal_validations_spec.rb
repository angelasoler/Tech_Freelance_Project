require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context 'validations' do
    it 'same profile cannot send more than one proposal for one project' do
      perfil_pablo = create(:profile)
      panaderia = create(:owner)
      project1 = create(:project, owner: panaderia)
      create(:proposal, profile: perfil_pablo)
      proposta2 = Proposal.create(motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia',
                                  hourly_rate: 40, hours_per_week: 8, weeks: 10, project: project1,
                                  profile: perfil_pablo)

      proposta2.valid?

      expect(proposta2.errors[:profile]).to include('já está em uso')
      expect(proposta2.valid?).to eq(false)
    end

    it 'action accept does not need feed back' do
      proposta = create(:proposal, status: 'accepted')

      proposta.valid?

      expect(proposta.valid?).to eq(true)
      expect(proposta.errors[:feed_back]).not_to include('não pode ficar em branco')
    end
  end
end
