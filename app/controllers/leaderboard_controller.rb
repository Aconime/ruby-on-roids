class LeaderboardController < ApplicationController
  def index
    @teams = Team.order(points: :desc)
    @pagy, @teams = pagy(@teams)
  end
end
