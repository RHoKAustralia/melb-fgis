class GeoController < ApplicationController

  respond_to :json

  def index
    trucks = Truck.all(:limit => 3)
    respond_with trucks
  end

  def show
    respond_with Truck.find(params[:id]).to_geo_json
  end
end
