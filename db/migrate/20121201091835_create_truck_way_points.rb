class CreateTruckWayPoints < ActiveRecord::Migration
  def change
    create_table :truck_way_points do |t|
      t.integer :truck_id
      t.point :latlon, :geographic => true

      t.timestamps
    end
    add_index :truck_way_points, :truck_id
  end
end
