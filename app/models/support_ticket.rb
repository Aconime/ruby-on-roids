class SupportTicket < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :ticket_replies, dependent: :destroy
end
