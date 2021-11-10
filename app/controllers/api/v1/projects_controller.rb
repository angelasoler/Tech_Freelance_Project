class Api::V1::ProjectsController < Api::V1::ApiController

  def index
    @projects = Project.all
    render json: @projects.to_json(except: %i[created_at update_at proposal_id],
                                  include: { proposals: { only: %i[motivation] } })
  end

  def show
    @project = Project.find(params[:id])
    render json: @project
  end

  def create
    @project = Project.create(project_params)
    render status: 201, json: @project
  end

  private

  def project_params
    params.require(:project).permit(:title, :description,
                                    :desire_habilities,
                                    :max_hour_payment,
                                    :deadline_for_proposals,
                                    :face_to_face, :remote)
  end
end
