class AddPrivateEventFeatures < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :invite_status, :boolean, default: false
    add_column :invites, :rsvp_status, :integer, default: 2

    add_column :events, :private, :boolean, default: 0
  end
end
