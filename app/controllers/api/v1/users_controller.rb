class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update]

  def index
    @users = policy_scope(User)
  end

  def show; end

  def update
    @user.update(user_params)

    render :show
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :headline, :about, :skills, :available)
  end
end
