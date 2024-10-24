class ActivitiesController < ApplicationController

    def new
        @activity = project.activities.new
        @form_url = project_activities_path
    end

    def edit
        @activity = project.activities.find(params[:id])
        @form_url = project_activity_path
    end

    def create
        @activity = project.activities.new(permited_params)
        if @activity.valid? && @activity.save
            redirect_to project_path(project)
        end
    end

    def update
        @activity = project.activities.find(params[:id])
        if @activity.update(permited_params)
            redirect_to project_path(project)
        end
    end

    def destroy
        @activity = project.activities.find(params[:id])
        if @activity.destroy
            redirect_to project_path(project)
        end
    end

    private

    def permited_params
        params.fetch(:activity, {}).permit(:id, :name, :start_date, :end_date, :finished, :project_id)
    end

    def project
        @project ||= Project.find(params[:project_id])
    end
end