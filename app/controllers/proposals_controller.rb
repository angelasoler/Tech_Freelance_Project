class ProposalsController < ApplicationController
  # def show
  #   @proposal = Proposal.find(params[:id])
  # end

  # def create
  #   @proposal = Proposal.create(proposal_params) 
  #   @proposal.project = Project.ids 
  #   @proposal.profile = Profile.ids
  #   @proposal.save!

  #   if @proposal.save
  #     redirect_to proposal_path(@proposal.id)
  #   else
  #     render 'nao foi possivel enviar proposta'
  #   end
  # end

  # def proposal_params
  #   params.require(:proposal).permit(:motivation, :hourly_rate, 
  #                                     :hours_per_week, :weeks, :project, 
  #                                     :proposal
  #                                   )
  # end
end
