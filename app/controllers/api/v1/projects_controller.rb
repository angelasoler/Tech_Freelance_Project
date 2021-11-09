class Api::V1::ProjectsController < ActionController::API
  def index
    @projects = Project.all
    render json: @projects.to_json(except: %i[created_at update_at proposal_id],
                                  include: { proposals: { only: %i[motivation] } })
  end

  def show
    @project = Project.find(params[:id])
    render json: @project
  end
end
