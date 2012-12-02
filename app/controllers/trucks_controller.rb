class TrucksController < ApplicationController

  respond_to :json

  def index

    @trucks = Truck.all
    respond_with @trucks

  end

  def create
    @truck = Truck.new(params[:truck])
    if @truck.save
      respond_with @truck.to_json(:include => [:way_points]), status: :created, location: @truck
    end

    WebsocketRails[:truck_channel].trigger(:truck_event, @truck)
  end

  def show
    @truck = Truck.find(params[:id])
    respond_with @truck.to_json(:include => [:way_points]), status: :ok
  end

  def destroy
  end

end
