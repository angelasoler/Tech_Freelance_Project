class Api::V1::ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::ActiveRecordError, with: :render_generic_error

  private
  
  def render_generic_error
    render status: 500, json: '{ message: Erro geral }'
  end

  def render_not_found
    render status: 404, json: '{ message: Objeto não encontrado }'
  end
end