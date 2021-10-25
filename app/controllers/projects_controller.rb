class ProjectsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create]
  # before_action :authenticate_freelancer!, only: [:new, :create, :show]
  def show
    if owner_signed_in?
      @project = Project.find(params[:id])
      @proposal = Proposal.new
      @proposals = @project.proposals.all
    elsif current_freelancer.profile.blank?
      redirect_to new_profile_path
    end
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    @project.owner = current_owner
    if @project.save
      redirect_to project_path(@project.id)
    else
      render :new
    end
  end

  def project_params
    params.require(:project).permit(:title, :description, 
                                    :desire_habilities, 
                                    :max_hour_payment, 
                                    :deadline_for_proposals, 
                                    :face_to_face, :remote
                                    )
  end

  def my_projects
    @projects = current_owner.projects
  end
end

  
