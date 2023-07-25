class SupportTicketsController < ApplicationController
  before_action :check_user_present
  before_action :set_support_ticket, only: %i[show destroy]

  def show; end

  def new
    @support_ticket = SupportTicket.new
  end

  def create
    @support_ticket = SupportTicket.new(support_ticket_params)

    if @support_ticket.save
      redirect_to support_ticket_path(@support_ticket),
notice: 'Support ticket was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @support_ticket.update(support_ticket_params)
      redirect_to support_ticket_url(@support_ticket),
notice: 'Support ticket was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @support_ticket.destroy

    redirect_to support_tickets_url, notice: 'Support ticket was successfully destroyed.'
  end

  private

  def set_support_ticket
    @support_ticket = SupportTicket.find(params[:id])
  end

  def support_ticket_params
    params.require(:support_ticket).permit(:user_id, :title, :message)
  end

  def check_user_present
    redirect_to root_path, notice: 'You must be logged in' unless Current.user
  end
end
