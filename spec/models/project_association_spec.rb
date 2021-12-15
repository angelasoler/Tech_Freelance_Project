require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'project' do
    context ' belongs to owner' do
      it { should belong_to(:owner) }
    end
  end
end
