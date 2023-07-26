class User < ApplicationRecord
  belongs_to :team, optional: true
  has_one :owned_team, class_name: 'Team', foreign_key: 'owner_id', dependent: :nullify
  has_many :support_tickets, dependent: :destroy

  has_secure_password

  validates :email,
            presence: true,
            format: {
              with: /\A[^@\s]+@[^@\s]+\z/,
              message: 'must be a valid email address'
            }

  def name
    "#{first_name.humanize} #{last_name.humanize}"
  end

  def profile_image
    return 'placeholders/profile_image.png' if image_url.blank?

    image_url
  end

  def team_requests
    TeamRequest.where(user_id: id)
  end
end
