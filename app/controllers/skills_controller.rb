class SkillsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_skill, only: [:destroy, :update]

  def create
    @skill = Skill.new(skill_params)
    authorize @skill
    @skill.user = @user

    @icon = Icon.find_by_name(@skill[:skill_name].downcase)

    if @icon.nil?
      @skill.icon = Icon.find_by(id: 2)
    else
      @skill.icon = @icon
    end

    if @skill.save
      redirect_to (user_path(@skill.user) + "#goto-skill-#{@skill.id}")
    else
      # Can't render show - where should this lead to?
      render 'users/show'
    end
  end

  def update
    @skill.update(skill_params)

    if @skill.save
      redirect_to (user_path(@skill.user) + "#goto-skill-#{@skill.id}")
    else
      render 'users/show'
    end
  end

  def destroy
    @skill.destroy

    redirect_to user_path(current_user)
  end

  private

  def skill_params
    params.require(:skill).permit(:skill_name, :level, :years_of_experience)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_skill
    @skill = Skill.find(params[:id])
    authorize @skill
  end
end
