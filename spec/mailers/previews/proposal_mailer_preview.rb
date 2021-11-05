class ProposalMailerPreview < ApplicationMailer
  def notify_new_proposal
    proposal = FactoryBot.create(:proposal)
    ProposalMailer.with(proposal: proposta).notify_new_proposal
  end
end