class AddPointsToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :points, :integer
  end
end
