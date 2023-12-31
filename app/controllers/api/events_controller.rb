class Api::EventsController < Api::BaseController
  before_action :set_event, only: %i[show edit update destroy]

  # GET /api/events or /api/events.json
  def index
    @events = Event.all
  end

  # GET /api/events/1 or /api/events/1.json
  def show; end

  # GET /api/events/new
  def new
    @event = Event.new
  end

  # GET /api/events/1/edit
  def edit; end

  # POST /api/events or /api/events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html do
          redirect_to api_event_url(@event), notice: 'Event was successfully created.'
        end
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/events/1 or /api/events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html do
          redirect_to api_event_url(@event), notice: 'Event was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/events/1 or /api/events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html do
        redirect_to api_events_url, notice: 'Event was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.fetch(:event, {})
  end
end
