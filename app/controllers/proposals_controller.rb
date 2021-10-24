class ProposalsController < ApplicationController
  def show
    @proposal = Proposal.find(params[:id])
    @proposals = Proposal.all
    if Proposal.accepted?
      redirect_to proposal_path(@proposal)
      flash.alert = 'Proposta Aceita!'
    elsif Proposal.turned_down?
      redirect_to feed_back_path
      flash.alert = 'Pfvr retorne um feedback!'
    end
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

  def status_accepted 
  end

  def status_turned_down
  end
end
