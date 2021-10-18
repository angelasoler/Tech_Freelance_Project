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
    # before do
    #   angela = Freelancer.create!(email: 'angela@mail.com', password: '123456')
    #   login_as angela, scope: :freelancer
    # end
#     it 'can´t send a proposal' do
#       post new_proposal_path

#       expect(response).to redirect_to(new_freelancer_profile_pat)
#     end
#   end
  #   it 'cannot access new project url' do
  #     

  #     get new_project_path

  #     expect(response).to redirect_to(root_path)
  #   end

    # it 'profile_path redirect to complete profile form' do
      
    #   get profile_path

    #   expect(response).to redirect_to(new_profile_path)
    # end
  # end
  # end
end