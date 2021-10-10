class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
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
end

  
