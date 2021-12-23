require 'rails_helper'

RSpec.describe Proposal, type: :model do
  context 'validations' do
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
  end
end
