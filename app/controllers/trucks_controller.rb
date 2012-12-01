class TrucksController < ApplicationController

  respond_to :json

  def index

    @trucks = Truck.all
    respond_with @trucks

  end

  def create
    @truck = Truck.new(params[:truck])
    if @truck.save
      respond_with @truck, status: :created, location: @truck
    end
  end

  def show
  end

  def destroy
  end

end
