class CreateSupportTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :support_tickets do |t|
      t.references :user, null: false
      t.string :title
      t.text :message

      t.timestamps
    end
  end
end
