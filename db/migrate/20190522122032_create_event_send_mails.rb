class CreateEventSendMails < ActiveRecord::Migration[5.2]
  def change
    create_table :event_send_mails do |t|
      t.references :event, foreign_key: true
      t.references :send_to, foreign_key: true
      t.string :subject
      t.string :body

      t.timestamps
    end
  end
end
