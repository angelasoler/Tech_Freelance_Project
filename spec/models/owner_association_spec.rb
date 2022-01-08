require 'rails_helper'

RSpec.describe Owner, type: :model do
  describe 'owner' do
    context 'has many projects and proposals' do
      it { should have_many(:projects).dependent(:destroy) }
      it { should have_many(:proposals).through(:projects) }
    end
  end
end
