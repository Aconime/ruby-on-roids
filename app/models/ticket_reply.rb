class TicketReply < ApplicationRecord
  belongs_to :support_ticket
  belongs_to :user
end
