class GeoController < ApplicationController

  respond_to :json

  def index
    trucks = Truck.all(:limit => 3)
    respond_with trucks
  end

  def show
    truck = Truck.find(params[:id])

    features = []
    truck.way_points.each do |way_point|
      features << RGeo::GeoJSON::EntityFactory.instance.feature(way_point.latlon, way_point.id, :time => way_point.created_at.to_s)
    end
     collection = RGeo::GeoJSON::EntityFactory.instance.feature_collection(features)

    respond_with RGeo::GeoJSON.encode(collection)
  end
end
