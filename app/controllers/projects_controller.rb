class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def edit
        @project = Project.find(params[:id])
    end

    def create
        @project = Project.new(permited_params)
        if @project.valid? && @project.save
            flash[:notice] = "Projeto criado com sucesso"
            redirect_to project_path(@project)
        else
            flash[:error] = @project.errors.objects.first.full_message
            redirect_to new_project_path
        end
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(permited_params)
            flash[:notice] = "Projeto atualizado com sucesso"
            redirect_to project_path(@project)
        else
            flash[:error] = @project.errors.objects.first.full_message
            redirect_to edit_project_path(@project)
        end
    end

    def destroy
        @project = Project.find(params[:id])
        if @project.destroy
            flash[:notice] = "Projeto excluído com sucesso"
            redirect_to projects_path
        end
    end

    private

    def permited_params
        params.fetch(:project).permit(:name, :start_date, :end_date)
    end
end