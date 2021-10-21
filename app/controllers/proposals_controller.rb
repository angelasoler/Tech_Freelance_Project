class ProposalsController < ApplicationController
  def show
    @proposal = Proposal.find(params[:id])
    @proposals = Proposal.all
  end

  def create
    @proposal = Proposal.create(proposal_params) 
    @proposal.project = Project.find(params[:project_id])
    @proposal.profile = current_freelancer.profile
    @proposal.save!

    redirect_to proposal_path(@proposal.id)
    flash.alert = 'Sua proposta foi enviada para ser avaliada pelo dono do projeto!'
  end

  def proposal_params
    params.require(:proposal).permit(:motivation, :hourly_rate, 
                                      :hours_per_week, :weeks
                                    )
  end
end
