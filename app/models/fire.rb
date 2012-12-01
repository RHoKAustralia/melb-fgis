class Fire < ActiveRecord::Base
  attr_accessible :name

      # By default, use the GEOS implementation for spatial columns.
  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  # But use a geographic implementation for the :latlon column.
  set_rgeo_factory_for_column(:region, RGeo::Geographic.spherical_factory(:srid => 4326))

  attr_accessible :region

end
