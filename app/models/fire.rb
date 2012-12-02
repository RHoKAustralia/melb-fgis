class Fire < ActiveRecord::Base
  attr_accessible :name

  # By default, use the GEOS implementation for spatial columns.
  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  # But use a geographic implementation for the :latlon column.
  set_rgeo_factory_for_column(:region, RGeo::Geographic.spherical_factory(:srid => 4326))

  attr_accessible :region

  def to_geo_json

    f = RGeo::GeoJSON::EntityFactory.instance.feature(self.region, self.id, :time => self.created_at.to_s)
    json = JSON.parse(RGeo::GeoJSON.encode(f).to_json)

    output =
      {
        :id => self.id,
        :description => self.name,
        :geo => json
      }
    output.to_json
  end

end
