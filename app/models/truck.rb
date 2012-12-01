class Truck < ActiveRecord::Base
  attr_accessible :callsign

  has_many :way_points, :dependent => :destroy, :class_name => 'TruckWayPoint', :order => 'created_at DESC'
end
