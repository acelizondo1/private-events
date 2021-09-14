class UsersController < ApplicationController

    def show 
        #@user = current_user
        @events = current_user.created_events
    end
end