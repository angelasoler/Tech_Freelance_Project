class ProjectsController < ApplicationController
  before_action :authenticate_owner!, only: %i[new create]
  before_action only: %i[show] do
    @project = Project.find(params[:id])
    redirect_to root_path unless current_owner == @project.owner || freelancer_signed_in?
  end

  def show
    @project = Project.find(params[:id])
    @proposal = @project.proposals.new
    @proposals = @project.proposals.all
    redirect_to new_profile_path if freelancer_signed_in? && current_freelancer.profile.blank?
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
                                    :face_to_face, :remote)
  end

  def my_projects
    @projects = current_owner.projects
  end
end
