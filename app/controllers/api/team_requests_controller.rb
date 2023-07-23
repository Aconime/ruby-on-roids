class Api::TeamRequestsController < ApplicationController
  before_action :set_team_request, only: %i[show edit update destroy]

  # GET /api/team_requests or /api/team_requests.json
  def index
    @team_requests = TeamRequest.all
  end

  # GET /api/team_requests/1 or /api/team_requests/1.json
  def show; end

  # GET /api/team_requests/new
  def new
    @team_request = TeamRequest.new
  end

  # GET /api/team_requests/1/edit
  def edit; end

  # POST /api/team_requests or /api/team_requests.json
  def create
    @team_request = TeamRequest.new(team_request_params)

    respond_to do |format|
      if @team_request.save
        format.html do
          redirect_to api_team_request_url(@team_request),
         notice: 'Team request was successfully created.'
        end
        format.json { render :show, status: :created, location: @team_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/team_requests/1 or /api/team_requests/1.json
  def update
    respond_to do |format|
      if @team_request.update(team_request_params)
        format.html do
          redirect_to api_team_request_url(@team_request),
         notice: 'Team request was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @team_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/team_requests/1 or /api/team_requests/1.json
  def destroy
    @team_request.destroy

    respond_to do |format|
      format.html do
        redirect_to api_team_requests_url,
notice: 'Team request was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team_request
    @team_request = TeamRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_request_params
    params.fetch(:team_request, {})
  end
end
