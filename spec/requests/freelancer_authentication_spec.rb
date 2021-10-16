require 'rails_helper'

describe 'freelancer authentication' do
  it 'can´t open new profile form unless authenticated' do
    get new_freelancer_profile_path

    expect(response).to redirect_to(new_freelancer_session_path)
  end

  it 'can´t make a proposal without complete profile' do
    post new_proposal_path

    expect(response).to redirect_to(new_freelancer_profile_pat)
  end

  it 'can´t open new proposal form unless authenticated' do
    get new_proposal_path

    expect(response).to redirect_to(new_freelancer_session_path)
  end
end