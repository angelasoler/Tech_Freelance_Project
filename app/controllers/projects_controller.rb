class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
  end

  def project_params
    params.require(:project).permit(:title, :description, 
                                    :desire_habilities)
  end
end

  
