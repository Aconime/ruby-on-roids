class Api::TeamsController < Api::BaseController
  before_action :set_team, only: %i[show edit update destroy]

  # GET /api/teams or /api/teams.json
  def index
    @teams = Team.all
  end

  # GET /api/teams/1 or /api/teams/1.json
  def show; end

  # GET /api/teams/new
  def new
    @team = Team.new
  end

  # GET /api/teams/1/edit
  def edit; end

  # POST /api/teams or /api/teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html do
          redirect_to api_team_url(@team), notice: 'Team was successfully created.'
        end
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/teams/1 or /api/teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html do
          redirect_to api_team_url(@team), notice: 'Team was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/teams/1 or /api/teams/1.json
  def destroy
    @team.destroy

    respond_to do |format|
      format.html do
        redirect_to api_teams_url, notice: 'Team was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.fetch(:team, {})
  end
end
