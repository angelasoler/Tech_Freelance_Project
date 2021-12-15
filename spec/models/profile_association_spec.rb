require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'profile' do
    context 'belongs to freelancer' do
      it { should belong_to(:freelancer) }
    end

    context 'has one attached photo' do
      it { should have_one_attached(:photo) }
    end

    context 'has many proposals' do
      it { should have_many(:proposals).dependent(:destroy) }
    end
  end
end
