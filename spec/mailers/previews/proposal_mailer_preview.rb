class ProposalMailerPreview < ActionMailer::Preview
  def notify_new_proposal
    owner = Owner.create!(email: 'asjknkjbfajbfj@gmail.com', password: '123456')
    project = FactoryBot.create(:project, owner: owner)
    proposal = FactoryBot.create(:proposal, project: project)
    ProposalMailer.with(proposal: proposal).notify_new_proposal
  end
end
