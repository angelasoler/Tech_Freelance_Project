Class Api::V1::ProjectsController < ActionController::API
  def index
    @projects = Projects.all
    render json: @projects.to_json(except: %i[created_at update_at proposal_id],
                                  include: { proposal: { only: %i[motivation] } })
  end

  def show
    @project = Project.find(params[:id])
    render JSON
  end
end
