class TeamRequest < ApplicationRecord
  belongs_to :team
  belongs_to :user

  delegate :name, to: :team, prefix: true
end
