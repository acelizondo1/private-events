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
        if private_event
            invite_status = true
            user = set_user
            user_id = user.id
        else
            invite_status = false
            user_id = current_user.id
        end

        invite = Invite.new(:invitee_id => user_id, :invited_event_id => @event.id, :invite_status => invite_status, :rsvp_status => 2)
        
        respond_to do |format|
            if invite.save
                if private_event
                    format.html { redirect_to new_invite_path(event_id: @event.id), notice: "#{user.full_name} has been invited" }
                else 
                    format.html { redirect_to event_path(@event), notice: "You have joined the guest list for #{@event.name}" }
                end
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

    def set_user
        User.find(params[:user_id])
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