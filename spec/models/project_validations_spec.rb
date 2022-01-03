require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '#valid?' do
    context 'deadline for proposal' do
      it 'it`s in the past' do
        projeto = build(:project, deadline_for_proposals: Time.zone.now + 1.month)

        projeto.valid?

        expect(projeto.errors[:deadline_for_proposals]).to include('deve ser maior que dois meses.')
        expect(projeto.valid?).to eq(false)
      end

      it 'should be at least 2 months from now' do
        projeto = build(:project, deadline_for_proposals: Time.zone.now + 1.month)

        projeto.valid?

        expect(projeto.errors[:deadline_for_proposals]).to include('deve ser maior que dois meses.')
        expect(projeto.valid?).to eq(false)
      end

      it 'most be date data type' do
        project = build(:project, deadline_for_proposals: 'dfnkgklndfg')
    
        project.valid?
    
        expect(project.valid?).to eq(false) 
        expect(project.errors[:deadline_for_proposals]).to include('deve ser uma data valida.')
      end
    end

    context 'legth of create form fields:' do
      it { should validate_length_of(:title).is_at_least(8).is_at_most(40).on(:create) }
      it { should validate_length_of(:description).is_at_least(20).is_at_most(200).on(:create) }
      it { should validate_numericality_of(:max_hour_payment).is_greater_than(50).on(:create) }
    end

    it 'most check a least one type of work' do
      project = build(:project, remote: false, face_to_face: false)

      project.valid?

      expect(project.errors[:project]).to include('Escolha ao menos um tipo de trabalho')
      expect(project.valid?).to eq(false)
    end
  end
end
