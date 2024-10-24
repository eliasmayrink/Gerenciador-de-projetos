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
            redirect_to project_path(@project)
        end
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(permited_params)
            redirect_to project_path(@project)
        end
    end

    def destroy
        @project = Project.find(params[:id])
        if @project.destroy
            redirect_to projects_path
        end
    end

    private

    def permited_params
        params.fetch(:project).permit(:name, :start_date, :end_date)
    end
end