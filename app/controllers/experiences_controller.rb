class ExperiencesController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_experience, only: [:destroy, :update]

  def create
    @experience = Experience.new(experience_params)
    authorize @experience
    @experience.user = @user

    if @experience.save
      redirect_to (user_path(@experience.user) + "#experience-#{@experience.id}")
    else
      # Can't render show - where should this lead to?
      render 'users/show'
    end
  end

  def update
    @experience.update(experience_params)

    if @experience.save
      redirect_to (user_path(@experience.user) + "#experience-#{@experience.id}")
    else
      render 'users/show'
    end
  end

  def destroy
    @experience.destroy

    redirect_to user_path(current_user)
  end

  private

  def experience_params
    params.require(:experience).permit(:experience_name, :company, :role, :start_date, :end_date, :location, :website_url, :summary, :photo)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_experience
    @experience = Experience.find(params[:id])
    authorize @experience
  end
end
