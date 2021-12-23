require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context 'validates' do
    it 'same profile cannot send more than one proposal for one project' do
      perfil_pablo = create(:profile)
      panaderia = create(:owner)
      project1 = create(:project, owner: panaderia)
      create(:proposal, profile: perfil_pablo)
      proposta2 = Proposal.create(motivation: 'Sou expecialista em redes sociais com 6 anos de experiencia',
                                  hourly_rate: 40, hours_per_week: 8, weeks: 10, project: project1,
                                  profile: perfil_pablo)

      proposta2.valid?

      expect(proposta2.valid?).to eq(false)
    end

    context 'profile is unique in relation to project' do
      it { should validate_uniqueness_of(:profile_id).scoped_to(:project_id).with_message('Só pode mandar uma proposta por projeto.') }
    end

    it 'action accept does not need feed back' do
      proposta = create(:proposal, status: 'accepted')

      proposta.valid?

      expect(proposta.valid?).to eq(true)
      expect(proposta.errors[:feed_back]).not_to include('não pode ficar em branco')
    end

    context 'presence of information in form fields' do
      it { should validate_presence_of(:motivation).on(:create) }
      it { should validate_presence_of(:hourly_rate).on(:create) }
      it { should validate_presence_of(:hours_per_week).on(:create) }
      it { should validate_presence_of(:weeks).on(:create) }
    end

    context 'characteristiques of each attribute' do
      it { should validate_length_of(:motivation).is_at_least(15).is_at_most(200).on(:create) }
      it {
        should validate_numericality_of(:hourly_rate)
          .is_less_than_or_equal_to(200)
          .is_greater_than_or_equal_to(50)
          .on(:create)
      }
      it {
        should validate_numericality_of(:hours_per_week)
          .is_less_than_or_equal_to(40)
          .is_greater_than_or_equal_to(10)
          .on(:create)
      }
      it { should validate_numericality_of(:weeks).on(:create) }
    end
  end
end
