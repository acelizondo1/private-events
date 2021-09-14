class EventsController < ApplicationController


    def index
        @events = Event.all 
    end

    def show 
        set_event
    end

    def new
        @event = Event.new
    end

    def edit
        set_event
    end

    def create
        @event = Event.new
    end

    def update 
        set_event

    end

    def destroy 
        set_event
    end

    private 
    def event_params
        params.require(:event).allow(:name, :date, :location)
    end

    def set_event
        @event = Event.find(params[:id])
    end

end
