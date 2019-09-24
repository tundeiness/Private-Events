class EventsController < ApplicationController
  #before_action :signed_in_user, only: [:new]
    def new
        @event = Event.new
    end

    def create
      @event = current_user.created_events.build(event_params)
     if @event.save
      flash[:success] = "Event created!"
      redirect_to current_user
     else
      render 'new'
     end
   end

    def show
        @event = Event.find(params[:id])
    end    

    def index
        @events = Event.all
    end

private

  def event_params
    params.require(:event).permit(:title, :date, :location, :description)
  end

  def signed_in_user
    redirect_to signin_path unless signed_in?
  end
end
