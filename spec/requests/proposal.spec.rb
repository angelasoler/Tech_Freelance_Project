require 'rails_helper'
  describe 'proposal' do
    it 'cannot be send after dead line' do
      projeto = create(:project, deadline_for_proposals: Time.zone.now - 1.days) 
      vacilao = create(:profile)
      login_as vacilao.freelancer, scope: :freelancer

      get projects_path(projeto)

      expect(response).to redirect_to(root_path)
    end
  end
end