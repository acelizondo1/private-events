class EventsController < ApplicationController


    def index
        @events = Event.where(private: false)
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
              format.html { redirect_to event_path(@event), notice: "Event was successfully created." }
              format.json { render :show, status: :created, location: @event }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

    def update 
        set_event
        respond_to do |format|
            if @event.update(event_params)
              format.html { redirect_to "/users/:current_user.id", notice: "Post was successfully updated." }
              format.json { render :show, status: :ok, location: @event }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy 
        set_event
        @event.destroy
        respond_to do |format|
            format.html { redirect_to "/users/:current_user.id", notice: "Event was successfully deleted." }
            format.json { head :no_content }
        end
    end

    private 
    def event_params
        params.require(:event).permit(:name, :date, :location, :private)
    end

    def set_event
        @event = Event.find(params[:id])
    end

end
