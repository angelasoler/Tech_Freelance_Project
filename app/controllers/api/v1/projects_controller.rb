module Api
  module V1
    class ProjectsController < Api::V1::ApiController
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
        render status: :created, json: @project
      end

      private

      def project_params
        params.require(:project).permit(:title, :description,
                                        :desire_habilities,
                                        :max_hour_payment,
                                        :deadline_for_proposals,
                                        :face_to_face, :remote, :owner_id)
      end
    end
  end
end
