require 'rails_helper'

RSpec.describe Proposal, type: :model do
  describe 'proposal' do
    context ' belongs to' do
      it 'profile and to project' do
        should belong_to(:profile)
        should belong_to(:project)
      end
    end
  end
end
