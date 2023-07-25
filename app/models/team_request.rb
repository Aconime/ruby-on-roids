class TeamRequest < ApplicationRecord
  belongs_to :team
  belongs_to :user

  def team_name
    team.name
  end
end
