class Api::UsersController < Api::BaseController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /api/users or /api/users.json
  def index
    @users = User.all
  end

  # GET /api/users/1 or /api/users/1.json
  def show; end

  # GET /api/users/new
  def new
    @user = User.new
  end

  # GET /api/users/1/edit
  def edit; end

  # POST /api/users or /api/users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html do
          redirect_to api_user_url(@user), notice: 'User was successfully created.'
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/users/1 or /api/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to api_user_url(@user), notice: 'User was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/users/1 or /api/users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html do
        redirect_to api_users_url, notice: 'User was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {})
  end
end
