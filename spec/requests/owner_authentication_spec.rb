require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'not athenticated' do
    it 'can´t create project without login' do
      get new_project_path

      expect(response).to redirect_to(root_path)
    end

    it 'can´t open new project form unless authenticated' do
      get new_project_path

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to be_present
    end

    it 'can´t see proposals' do
      tom = create(:owner)
      marketin = create(:project, owner: tom)
      jerry = create(:freelancer)
      perfil_jerry = create(:profile, freelancer: jerry)
      proposta_jerry_tom = create(:proposal, project: marketin, profile: perfil_jerry)

      get proposal_path(proposta_jerry_tom)

      expect(response).to redirect_to(root_path)
    end

    it 'can´t accept or turn down proposals' do
      tom = create(:owner)
      marketin = create(:project, owner: tom)
      jerry = create(:freelancer)
      perfil_jerry = create(:profile, freelancer: jerry)
      proposta_jerry_tom = create(:proposal, project: marketin, profile: perfil_jerry)

      patch proposal_path(proposta_jerry_tom)

      expect(response).to redirect_to(root_path)
    end
  end
end
