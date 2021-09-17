class UsersController < ApplicationController

    def show 
        @created_events = current_user.created_events
        @invited_events = current_user.invited_events
    end
end