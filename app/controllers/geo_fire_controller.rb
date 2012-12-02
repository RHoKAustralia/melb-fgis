class GeoFireController < ApplicationController

  respond_to :json

  def index
    fires = Fire.all(:limit => 3)
    respond_with fires
  end

  def show
    respond_with Fire.find(params[:id]).to_geo_json
  end
end
