class UsersController < ApplicationController

    def show 
        @interval = 0
        @events = current_user.created_events
    end
end