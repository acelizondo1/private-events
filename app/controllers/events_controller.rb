class EventsController < ApplicationController


    def index
        @interval = 0
        @events = Event.all 
    end

    def show 
        set_event
    end

    def new
        @event = current_user.created_events.build
    end

    def edit
        set_event
    end

    def create
        @event = current_user.created_events.build(event_params)

        respond_to do |format|
            if @event.save
              format.html { redirect_to "/users/:current_user.id", notice: "Event was successfully created." }
              format.json { render :show, status: :created, location: @event }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

    def update 
        set_event
    end

    def destroy 
        set_event
        
    end

    private 
    def event_params
        params.require(:event).permit(:name, :date, :location)
    end

    def set_event
        @event = Event.find(params[:id])
    end

end
