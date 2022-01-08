require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'not athenticated' do
    it 'cannot create project without login' do
      get new_project_path

      expect(response).to redirect_to(new_owner_session_path)
      expect(flash[:alert]).to include('Para continuar, faça login ou registre-se.')
    end

    it 'cannot open new project form unless authenticated' do
      get new_project_path

      expect(response).to redirect_to(new_owner_session_path)
      expect(flash[:alert]).to include('Para continuar, faça login ou registre-se.')
    end

    it 'cannot see proposals' do
      proposta_jerry_tom = create(:proposal)

      get proposal_path(proposta_jerry_tom)

      expect(response).to redirect_to(root_path)
    end

    it 'cannot accept or turn down proposals' do
      proposta_jerry_tom = create(:proposal)

      patch proposal_path(proposta_jerry_tom)

      expect(response).to redirect_to(new_owner_session_path)
      expect(flash[:alert]).to include('Para continuar, faça login ou registre-se.')
    end
  end
end
