require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Freelance most complete profile' do
    it 'to see project details' do
      projeto_marketing = create(:project)
      jerry = create(:freelancer)
      login_as jerry, scope: :freelancer

      get project_path(projeto_marketing.id)

      expect(response).to redirect_to(new_profile_path)
    end
  end
end
