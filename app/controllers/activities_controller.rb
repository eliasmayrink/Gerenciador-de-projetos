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
            flash[:notice] = "Atividade criada com sucesso"
            redirect_to project_path(project)
        else
            flash[:error] = @activity.errors.objects.first.full_message
            redirect_to new_project_activity_path
        end
    end

    def update
        @activity = project.activities.find(params[:id])
        if @activity.update(permited_params)
            flash[:notice] = "Atividade Atualizada com sucesso"
            redirect_to project_path(project)
        else
            flash[:error] = @activity.errors.objects.first.full_message
            redirect_to edit_project_activity_path        
        end
    end

    def destroy
        @activity = project.activities.find(params[:id])
        if @activity.destroy
            flash[:notice] = "Atividade excluída com sucesso"
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