class User < ApplicationRecord
  belongs_to :team

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
