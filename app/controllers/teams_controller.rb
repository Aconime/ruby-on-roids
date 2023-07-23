class TeamsController < ApplicationController
  before_action :set_team,
                only: %i[show edit update destroy reject_request accept_request]
  before_action :validate_user_present, only: %i[new edit]

  def index
    @teams = Team.all
  end

  def show
    @team_request = TeamRequest.new
    @team_requests = @team.team_requests
  end

  def new
    @team = Team.new
  end

  def edit; end

  def create
    @team = Team.new(team_params)

    if @team.save
      Current.user.update(team: @team)
      redirect_to team_url(@team), notice: 'Team was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |_format|
      if @team.update(team_params)
        redirect_to team_url(@team), notice: 'Team was successfully updated.'
        render :show, status: :ok, location: @team
      else
        render :edit, status: :unprocessable_entity
        render json: @team.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @team.destroy

    respond_to do |_format|
      redirect_to teams_url, notice: 'Team was successfully destroyed.'
      head :no_content
    end
  end

  def accept_request
    redirect_to root_path unless Current.user.id == @team.owner_id

    request = TeamRequest.find(params[:request_id])
    user = User.find_by(id: request.user_id)
    user.update(team: @team)
    delete_other_user_requests(user.id)
    request.destroy
    redirect_to team_path(@team)
  end

  def reject_request
    redirect_to root_path unless Current.user.id == @team.owner_id

    request = TeamRequest.find(params[:request_id])
    request.destroy
    redirect_to team_path(@team)
  end

  private

  def delete_other_user_requests(user_id)
    TeamRequest.where(user_id: user_id).destroy_all
  end

  def validate_user_present
    redirect_to login_path, notice: 'You must be signed in' unless Current.user
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
