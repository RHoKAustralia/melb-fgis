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
      f = RGeo::GeoJSON::EntityFactory.instance.feature(way_point.latlon, way_point.id, :time => way_point.created_at.to_s)
      features << JSON.parse(RGeo::GeoJSON.encode(f).to_json)
    end
     json = JSON.parse(features.to_json)

    output =
      {
        :id => truck.id,
        :description => truck.callsign,
        :geo => {:type => 'FeatureCollection', :features => json}
      }

    respond_with output
  end
end
