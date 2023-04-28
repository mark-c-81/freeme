class ProjectsController < ApplicationController
    before_action :set_user, only: [:create]
    before_action :set_project, only: [:destroy, :update]

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.user = @user

    if @project.save
      redirect_to (user_path(@project.user) + "#project-#{@project.id}")
    else
      # Can't render show - where should this lead to?
      render 'users/show'
    end
  end

  def update
    @project.update(project_params)

    if @project.save
      redirect_to (user_path(@project.user) + "#project-#{@project.id}")
    else
      render 'users/show'
    end
  end

  def destroy
    @project.destroy

    redirect_to user_path(current_user)
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :photo)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project

  end
end
