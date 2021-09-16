class InvitesController < ApplicationController
    before_action :authenticate_user!

    def create
        set_event
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
        set_event
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
end