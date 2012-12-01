class CreateFires < ActiveRecord::Migration
  def change
    create_table :fires do |t|
      t.string :name
      #t.spatial  "geometry", :limit => {:srid=>4326, :type=>"polygon", :geographic=>true}
      t.polygon :region, :geographic => true

      t.timestamps
    end
  end
end
