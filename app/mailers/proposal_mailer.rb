class ProposalMailer < ApplicationMailer
  def notify_new_proposal
    @proposal = params[:proposal]
    @owner_mail = @proposal.project.owner.email
    mail(to: @owner_mail,
         subject: "Tem uma proposta nova para seu projeto #{@proposal.project.title}!")
  end
end
