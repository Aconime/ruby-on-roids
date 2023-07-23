class AddTechAndBioToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :technologies
      t.string :bio
      t.string :image_url
    end
  end
end
