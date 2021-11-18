require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'project' do
    context ' belongs to' do
      it 'owner' do
        should belong_to(:owner)
      end
    end
  end
end
