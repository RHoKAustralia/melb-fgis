class Truck < ActiveRecord::Base
  attr_accessible :callsign

  has_many :way_points, :dependent => :destroy, :class_name => 'TruckWayPoint', :order => 'created_at DESC'

  def to_geo_json
    features = []
    self.way_points.each do |way_point|
      f = RGeo::GeoJSON::EntityFactory.instance.feature(way_point.latlon, way_point.id, :time => way_point.created_at.to_s)
      features << JSON.parse(RGeo::GeoJSON.encode(f).to_json)
    end
    json = JSON.parse(features.to_json)

    output =
      {
        :id => self.id,
        :description => self.callsign,
        :geo => {:type => 'FeatureCollection', :features => json}
      }
    output.to_json
  end

  def after_save(record)
    WebsocketRails[:truck_channel].trigger(:truck_event, record.to_geo_json)
  end
end
