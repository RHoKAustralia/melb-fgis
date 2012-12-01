class CreateTruckWayPoints < ActiveRecord::Migration
  def change
    create_table :truck_way_points do |t|
      t.integer :truck_id
      t.point :latlon, :geographic => true

      t.timestamps
    end
  end
end
