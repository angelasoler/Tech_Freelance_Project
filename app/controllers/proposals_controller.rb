class ProposalsController < ApplicationController
  def show
    
  end

  def create
    @project = Project.find(params[:proposal][:project_id])
    @proposal = @project.proposal.build(proposal_params) 
    @proposal.profile = current_freelancer.profile_id
   
    
    @proposal.save

    redirect_to proposal_path
  end

  def proposal_params
    params.require(:proposal).permit(:motivation, :hourly_rate, 
                                      :hours_per_week, :weeks,
                                      :project_id, :profile_id
                                    )
  end
end
