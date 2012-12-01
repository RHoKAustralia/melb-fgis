class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :callsign
    end
  end
end
