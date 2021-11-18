require 'rails_helper'

describe 'freelancer authentication:' do
  context 'unauthenticated visitor can`t' do
    it 'open new profile form' do
      get new_profile_path

      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to be_present
    end
  end

  context 'without complete profile' do
    it 'can´t send a proposal' do
      create(:project)
      angela = create(:freelancer)
      login_as angela, scope: :freelancer

      get '/projects/1'

      expect(response).to redirect_to(new_profile_path)
    end
  end
end
