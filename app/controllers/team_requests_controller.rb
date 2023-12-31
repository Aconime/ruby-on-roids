class TeamRequestsController < ApplicationController
  before_action :set_team_request, only: %i[show edit update destroy]
  before_action :set_team
  # before_action :set_user

  def index
    @team_requests = TeamRequest.all
  end

  def show; end

  def new
    @team_request = TeamRequest.new
  end

  def edit; end

  def create
    @team_request = TeamRequest.new(team_request_params)

    respond_to do |_format|
      if @team_request.save
        redirect_to teams_url(@team_request),
                    notice: 'Team request was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |_format|
      if @team_request.update(team_request_params)
        redirect_to team_request_url(@team_request),
                    notice: 'Team request was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @team_request.destroy

    respond_to do |_format|
      redirect_to team_requests_url, notice: 'Team request was successfully destroyed.'
      head :no_content
    end
  end

  private

  def set_team
    @team = params[:id]
  end

  def set_team_request
    @team_request = TeamRequest.find(params[:id])
  end

  def team_request_params
    params.require(:team_request).permit(:message, :team_id, :user_id)
  end
end
