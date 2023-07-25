class CreateTicketReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_replies do |t|
      t.references :support_ticket, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
