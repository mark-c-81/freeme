class Api::V1::SkillsController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, only: [:update]
  before_action :set_skill, only: [:show, :update]
  before_action :set_user, only: [:update]
  skip_after_action :verify_authorized

  def show; end

  def update
    if @skill.update(skill_params)
      redirect_to api_v1_user_path(@user)
    else
      render_error
    end
  end

  def update_positions
    params[:position].each do |e|
      e[:position]
      e[:skill]
      skill = Skill.find_by_id(e[:skill])
      skill.position = e[:position]

      skill.save
    end
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
    authorize @skill
  end

  def skill_params
    params.require(:skill).permit(:skill_name, :position)
  end

  def render_error
    render json: { errors: @skill.errors.full_messages }, status: :unprocessable_entity
  end

  def set_user
    @user = User.where(id: @skill.user_id)
  end
end
