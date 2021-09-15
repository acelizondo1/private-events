class UsersController < ApplicationController

    def show 
        @user_show = true
        @interval = 0
        @events = current_user.created_events
    end
end