class GeoFireController < ApplicationController

  respond_to :json

  def index
    fires = Fire.all(:limit => 3)
    respond_with fires
  end

  def show
    fire = Fire.find(params[:id])

    f = RGeo::GeoJSON::EntityFactory.instance.feature(fire.region, fire.id, :time => fire.created_at.to_s)
    json = JSON.parse(RGeo::GeoJSON.encode(f).to_json)

    output =
      {
        :id => fire.id,
        :description => fire.name,
        :geo => json
      }

    respond_with output
  end
end
