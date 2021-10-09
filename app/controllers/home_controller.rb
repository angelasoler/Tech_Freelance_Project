class HomeController < ApplicationController
  def index
    @projects = Project.all
    if @projects.empty?
      render "Não há projetos disponiveis no momento."
    end
  end
end