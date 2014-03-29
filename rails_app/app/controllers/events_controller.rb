class EventsController < InheritedResources::Base
  def create
    @event = Event.new(event_params)
    if  @event.save
      redirect_to event_path(@event), :flash => { :success => "Event created!" }
    else
      redirect_to root_path
    end
  end

  def attend
    
  end

private
  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date, :slot, :price)
  end
end
