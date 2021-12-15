require 'rails_helper'

RSpec.describe Freelancer, type: :model do
  describe 'freelancer' do
    context 'has one profile' do
      it { should have_one(:profile).dependent(:destroy) }
    end
  end
end
