require 'rails_helper'

describe 'freelancer authentication:' do

  context 'unauthenticated visitor can`t' do
#     it 'acces complete view of project' do
#       get 'projects/1'

    #   expect(response).to redirect_to(root_path)
    # end
    
    it 'open new profile form' do
      get new_profile_path

      expect(response).to redirect_to(new_freelancer_session_path)
    end

#     it 'open new proposal' do
#       get new_proposal_path

#       expect(response).to redirect_to(new_freelancer_session_path)
#     end
  end

#   context 'without complete profile' do
#     it 'can´t send a proposal' do
#       post new_proposal_path

#       expect(response).to redirect_to(new_freelancer_profile_pat)
#     end
#   end
  # context 'authenticated freelancer' do
  #   it 'cannot access new project url' do
  #     angela = Freelancer.create!(email: 'angela@mail.com', password: '123456')
  #     login_as angela, scope: :freelancer

  #     get new_project_path

  #     expect(response).to redirect_to(root_path)
  #   end
  # end
end