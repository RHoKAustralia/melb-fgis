class EventsController < ApplicationController

  respond_to :json

  def index

    @events = Event.all
    respond_with @events

  end

  def create

    @event = Event.new(params[:event])
    if @event.save
      respond_with @event, status: :created, location: @event
    end

  end

  def show



  end

  def destroy
  end

end
