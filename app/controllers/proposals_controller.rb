class ProposalsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:status_accepted, :status_turned_down, :show]
  def show
    @proposal = Proposal.find(params[:id])
    @proposals = Proposal.all
    if @proposal.accepted?
      render :show
      flash.alert = 'Proposta Aceita!'
    elsif @proposal.turned_down?
      render :show
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
