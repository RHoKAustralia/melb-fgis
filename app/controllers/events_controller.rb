class EventsController < ApplicationController

  respond_to :json

  def index

    @events = Event.all
    respond_with @events

  end

  def create

    @event = Event.find(params[:id])
    respond_with @event

  end

  def show



  end

  def destroy
  end

end
