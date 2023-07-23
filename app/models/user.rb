class User < ApplicationRecord
  belongs_to :team, optional: true
  has_one :owned_team, class_name: 'Team', foreign_key: 'owner_id', dependent: :nullify

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
end
