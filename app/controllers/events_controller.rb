class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events=Event.all.order("created_at DESC")
    @event=Event.new
  end

  def new
    @event=current_user.created_events.build
  end

  def show
    @sign_up=SignUp.new
  end

  def create
    @event=current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = "Event '#{@event.title}' created!"
      redirect_to @event
    else
      flash[:alert] = "error!"
      render 'new'
    end
  end

  def update
    if @event.update
      flash[:success] = "Event '#{@event.title}' updated!"
    else
      flash[:alert] = "error!"
    end
    redirect_to @event
  end

  def destroy
      @event = Event.find(params[:id])
      @event.destroy
      respond_to do |format|
          format.html { redirect_to events_url notice: 'Event was successfully deleted.' }
          format.json { head :no_content }
      end
  end

  def past
    @events=Event.past
  end

  def upcoming
    @events=Event.upcoming
  end




private
def event_params
  params.require(:event).permit(:title, :description, :date, :location )
end

def set_event
  @event=Event.find(params[:id])
end
end
