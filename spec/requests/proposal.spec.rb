require 'rails_helper'

describe 'proposal' do
  it 'cannot be send after dead line' do
    projeto = create(:project, deadline_for_proposals: Time.zone.now - 1.day)
    vacilao = create(:profile)
    login_as vacilao.freelancer, scope: :freelancer

    get projects_path(projeto)

    expect(response).to redirect_to(root_path)
  end

  it 'is send on the day of dead line' do
    projeto = create(:project, deadline_for_proposals: Time.zone.now)
    vacilao = create(:profile)
    login_as vacilao.freelancer, scope: :freelancer

    get projects_path(projeto)

    expect(response).to redirect_to(root_path)
  end

  it 'cannot accept or turn down proposals if its not project owner' do
    tom = create(:owner)
    marketing = create(:project, owner: tom)
    jerry = create(:freelancer)
    perfil_jerry = create(:profile, freelancer: jerry)
    proposta_jerry_tom = create(:proposal, project: marketing,
                                           profile: perfil_jerry)
    login_as jerry, scope: :freelancer

    patch proposal_path(proposta_jerry_tom)

    expect(response).to redirect_to(root_path)
  end
end
