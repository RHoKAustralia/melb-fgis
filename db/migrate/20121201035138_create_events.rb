class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.point :latlon, :geographic => true

      t.timestamps
    end
  end
end
