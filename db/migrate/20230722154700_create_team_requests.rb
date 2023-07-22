class CreateTeamRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :team_requests do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
