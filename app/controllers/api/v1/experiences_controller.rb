class Api::V1::ExperiencesController < Api::V1::BaseController
  before_action :set_experience, only: [:show, :update]
  before_action :set_user, only: [:update]
  skip_after_action :verify_authorized

  def show; end

  def update
    if @experience.update(experience_params)
      redirect_to api_v1_user_path(@user)
    else
      render_error
    end
  end

  def update_positions
    params[:position].each do |e|
      experience = Experience.find_by_id(e[:experience])
      # binding.pry
      experience.position = e[:position]

      experience.save
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def experience_params
    params.require(:experience).permit(:position)
  end

  def render_error
    render json: { errors: @experience.errors.full_messages }, status: :unprocessable_entity
  end

  def set_user
    @user = User.where(id: @experience.user_id)
  end
end
