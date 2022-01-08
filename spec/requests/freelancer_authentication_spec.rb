require 'rails_helper'

describe 'freelancer authentication:' do
  context 'unauthenticated visitor cannot' do
    it 'open new profile form' do
      get new_profile_path

      expect(response).to redirect_to(new_freelancer_session_path)
      expect(flash[:alert]).to include('Para continuar, faça login ou registre-se.')
    end

    it 'see project view' do
      create(:project)

      get '/projects/1'

      expect(response).to redirect_to(root_path)
    end

    it 'cannot send a proposal' do
      create(:project)

      post '/projects/1/proposals'

      expect(response).to redirect_to(new_freelancer_session_path)
      expect(flash[:alert]).to include('Para continuar, faça login ou registre-se.')
    end
  end

  context 'without complete profile' do
    it 'see project view' do
      create(:project)
      angela = create(:freelancer)
      login_as angela, scope: :freelancer

      get '/projects/1'

      expect(response).to redirect_to(new_profile_path)
    end

    it 'cannot send a proposal' do
      create(:project)
      angela = create(:freelancer)
      login_as angela, scope: :freelancer

      post '/projects/1/proposals'

      expect(response).to redirect_to(new_profile_path)
    end
  end

  context 'loged in freelancer' do
    it 'try to accept or refuse proposal' do
      proposta_jerry_tom = create(:proposal)
      angela = create(:freelancer)

      login_as angela, scope: :freelancer

      patch proposal_path(proposta_jerry_tom)

      expect(response).to redirect_to(new_owner_session_path)
      expect(flash[:alert]).to include('Para continuar, faça login ou registre-se.')
    end
  end
end
