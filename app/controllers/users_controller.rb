class UsersController < ApplicationController

    def show 
        @created_events = current_user.created_events
        @invited_events = current_user.invited_events.where.not("rsvp_status=?", 0)

        @pending_event_invites = Event.joins(invites: :invitee).where("invites.invitee_id=? and invites.invite_status=? and invites.rsvp_status=?", current_user.id, 1, 2)
        @declined_event_invites = Event.joins(invites: :invitee).where("invites.invitee_id=? and invites.invite_status=? and invites.rsvp_status=?", current_user.id, 1, 0)
    end
end