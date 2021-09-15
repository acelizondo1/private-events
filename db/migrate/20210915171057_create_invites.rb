class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.references :invitee, foreign_key: { to_table: :users }
      t.references :invited_event, foreign_key: { to_table: :events } 

      t.timestamps
    end
  end
end
