require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'presence of information in form fields' do
    it { should validate_presence_of(:full_name).on(:create) }
    it { should validate_presence_of(:birth_date).on(:create) }
    it { should validate_presence_of(:educational_background).on(:create) }
    it { should validate_presence_of(:work_field).on(:create) }
    it { should validate_presence_of(:about_me).on(:create) }
    it { should validate_presence_of(:work_experience).on(:create) }
  end

  context 'length of attribute about me' do
    it { should validate_length_of(:about_me).is_at_least(15).is_at_most(120) }
  end

  it 'full name most have name and surname' do
    profile = build(:profile, full_name: 'angela')

    profile.valid?

    expect(profile.errors[:full_name]).to include('deve incluir nome e sobrenome.')
    expect(profile.valid?).to eq(false)
  end

  it 'birth date attribute most be date data type' do
    profile = build(:profile, birth_date: 512)

    profile.valid?

    expect(profile.valid?).to eq(false)
    expect(profile.errors[:birth_date]).to include('deve ser uma data valida.')
  end
end
