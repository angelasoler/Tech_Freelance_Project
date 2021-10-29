class ProposalsController < ApplicationController
  # before_action :authenticate_freelancer!, only: [:new, :create, :show]
  # before_action :authenticate_freelancer!, only: [:show, :accept, :turn_down]
  def show
    @proposal = Proposal.find(params[:id])
    @proposals = Proposal.all
  end

  def create
    @proposal = Proposal.create(proposal_params) 
    @proposal.project = Project.find(params[:project_id])
    @proposal.profile = current_freelancer.profile
    @proposal.feed_back = ''
    @proposal.save!

    redirect_to proposal_path(@proposal.id)
    flash.alert = 'Sua proposta foi enviada para ser avaliada pelo dono do projeto!'
  end

  def proposal_params
    params.require(:proposal).permit(:motivation, :hourly_rate, 
                                      :hours_per_week, :weeks, 
                                      :feed_back
                                    )
  end

  def accept
    @proposal = Proposal.find(params[:id])
    @proposal.accepted!
    flash[:notice] = 'Proposta Aceita!'
    render :show
  end

  def turn_down
    @proposal = Proposal.find(params[:id])
    @proposal.turned_down!
    @proposal.save
    redirect_to edit_proposal_path(@proposal)
  end

  
  def edit
    @proposal = Proposal.find(params[:id])
  end

  
  def update
    @proposal = Proposal.find(params[:id])
    @proposal.update(params.require(:proposal).permit(:feed_back))
    redirect_to proposal_path
  end

  def my_proposals_freelancer
    @proposals = current_freelancer.profile.proposals.all
  end
end
