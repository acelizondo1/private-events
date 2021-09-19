class InvitesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_event
    before_action :private_event, :new

    def new
        generate_uninvited
        @users_pending = @event.invitees.where(invite_status: true)
        @users_accepted = @event.invitees.where(rsvp_status: 1)
    end

    def create
        invite = Invite.new(:invitee_id => current_user.id, :invited_event_id => @event.id)
        
        respond_to do |format|
            if invite.save
                format.html { redirect_to event_path(@event), notice: "You have joined the guest list for #{@event.name}" }
                #format.json { render }
            else
                format.html { redirect_to event_path(@event), status: :unprocessable_entity}
                format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

    def update

    end

    def destroy
        invite = @event.invites.find_by invitee_id: current_user.id
        invite.destroy
        respond_to do |format|
            format.html { redirect_to event_path(@event), notice: "You have been removed from the guest list for #{@event.name}" } 
        end
    end

    private
    def set_event
        @event = Event.find(params[:event_id])
    end

    def private_event
        @event.private
    end
    
    def generate_uninvited
        @uninvited_users = []
        User.all.each do |user|
            @uninvited_users.push(user) if !user.invited_events.include?(@event)
        end
        @uninvited_users.count
    end
end