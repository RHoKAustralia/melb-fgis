class WayPointsController < ApplicationController

  respond_to :json

  def index
    respond_with TruckWayPoint.all
  end

  def create
    @truck = Truck.find(params[:truck_id])
    @way_point = @truck.way_points.build(params[:way_point])
    if @way_point.save
      respond_with(@way_point, status: :created, location: truck_way_point_url(@truck, @way_point))
    end
  end

  def show
    @way_point = TruckWayPoint.find(params[:id])
    respond_with @way_point, status: :ok
  end

  def destroy
  end

end
