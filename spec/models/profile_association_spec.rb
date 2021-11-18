require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'profile' do
    context 'belongs to' do
      it 'freelancer' do
        should belong_to(:freelancer)
      end
    end
  end
end
