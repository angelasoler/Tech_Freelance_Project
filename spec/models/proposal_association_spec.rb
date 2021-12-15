require 'rails_helper'

RSpec.describe Proposal, type: :model do
  describe 'proposal' do
    context ' belongs to profile and to project' do
      it { should belong_to(:profile) }
      it { should belong_to(:project) }
    end
  end
end
