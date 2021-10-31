class ProposalsController < ApplicationController
  before_action :authenticate_owner!, only: [:accept, :turn_down]
  def show
    if signed_in?
      @proposal = Proposal.find(params[:id])
      @proposals = Proposal.all
    else
      redirect_to root_path
    end
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
    redirect_to edit_proposal_path(@proposal)
  end

  
  def edit
    if owner_signed_in?
      @proposal = Proposal.find(params[:id])
    else
      redirect_to root_path
    end
  end

  
  def update
    if owner_signed_in?
      @proposal = Proposal.find(params[:id])
      @proposal.update!(params.require(:proposal).permit(:feed_back))
      @proposal.turned_down!
      if !@proposal.feed_back.blank?
        redirect_to proposal_path(@proposal)
      else
        flash[:alert] = 'Deve dar um feedback para recusar'
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def my_proposals_freelancer
    @proposals = current_freelancer.profile.proposals.all
  end
end
