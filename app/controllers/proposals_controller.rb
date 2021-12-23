class ProposalsController < ApplicationController
  before_action :authenticate_owner!, only: %i[accept turn_down update]
  before_action :authenticate_freelancer!, only: %i[create]
  before_action :verify_freelancer_profile_exists, only: %i[create]
  before_action only: %i[show] do
    @proposal = Proposal.find(params[:id])
    unless current_owner == @proposal.project.owner || current_freelancer == @proposal.profile.freelancer
      redirect_to root_path
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    @proposals = Proposal.all
  end

  def create
    @proposal = current_freelancer.profile.proposals.build(proposal_params)
    @proposal.project = Project.find(params[:project_id])
    if @proposal.save
      redirect_to proposal_path(@proposal.id), notice: t('.success')
      ProposalMailer.with(proposal: @proposal).notify_new_proposal.deliver_now
    else
      render '/projects/show', assigns: { project: @proposal.project }
    end
  end

  def proposal_params
    params.require(:proposal).permit(:motivation, :hourly_rate,
                                     :hours_per_week, :weeks,
                                     :feed_back)
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
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
    @proposal.update(params.require(:proposal).permit(:feed_back))
    @proposal.turned_down!
    if @proposal.feed_back.present?
      redirect_to proposal_path(@proposal)
    else
      flash[:alert] = 'Deve dar um feedback para recusar'
      render :edit
    end
  end

  def my_proposals_freelancer
    @proposals = current_freelancer.profile.proposals.all if freelancer_signed_in?
  end

  private

  def verify_freelancer_profile_exists
    redirect_to new_profile_path if Profile.find_by(freelancer: current_freelancer).blank?
  end
end
